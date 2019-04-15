import argparse
import deepspeech as ds
import numpy as np
import shlex
import subprocess
import sys

parser = argparse.ArgumentParser(description='DeepSpeech speech-to-text from microphone')
parser.add_argument('--model', required=True,
                    help='Path to the model (protocol buffer binary file)')
parser.add_argument('--alphabet', required=True,
                    help='Path to the configuration file specifying the alphabet used by the network')
parser.add_argument('--lm', nargs='?',
                    help='Path to the language model binary file')
parser.add_argument('--trie', nargs='?',
                    help='Path to the language model trie file created with native_client/generate_trie')
args = parser.parse_args()

LM_WEIGHT = 1.50
VALID_WORD_COUNT_WEIGHT = 2.25
N_FEATURES = 26
N_CONTEXT = 9
BEAM_WIDTH = 512

print('Initializing model...')

model = ds.Model(args.model, N_FEATURES, N_CONTEXT, args.alphabet, BEAM_WIDTH)
if args.lm and args.trie:
    model.enableDecoderWithLM(args.alphabet,
                              args.lm,
                              args.trie,
                              LM_WEIGHT,
                              VALID_WORD_COUNT_WEIGHT)
sctx = model.setupStream()

subproc = subprocess.Popen(shlex.split('rec -q -V0 -e signed -L -c 1 -b 16 -r 16k -t raw - gain -2'),
                           stdout=subprocess.PIPE,
                           bufsize=0)
print('You can start speaking now. Press Control-C to stop recording.')

try:
    while True:
        data = subproc.stdout.read(512)
        model.feedAudioContent(sctx, np.frombuffer(data, np.int16))
except KeyboardInterrupt:
    print('Transcription:', model.finishStream(sctx))
    subproc.terminate()
    subproc.wait()
