# Getting Started with DeepSpeech
Prerequisites:
1. Ensure that you have the latest version of python3 installed.
```
brew install python3
```
2. If training with an Nvidia GPU(s), ensure that you have the latest version of CUDA installed. Find the right set of drivers for your graphics card [here](https://www.nvidia.com/Download/index.aspx?lang=en-us)

1. Clone the DeepSpeech repo
```
git clone git@github.com:mozilla/DeepSpeech.git
```
2. Installed the required dependencies
```
cd DeepSpeech
pip3 install -r requirements.txt
pip3 install $(python3 util/taskcluster.py --decoder)

```
3. If using an Nvidia GPU, you'll need to install the gpu version of tensorflow:
```
pip3 uninstall tensorflow
pip3 install 'tensorflow-gpu==1.13.1'
```

4. Run deepspeech with the following command:
```
python3.6 DeepSpeech.py --train_files /data/swb/LDC97S62/swb-train.csv --dev_files /data/swb/LDC97S62/swb-dev.csv --test_files /data/swb/LDC97S62/swb-test.csv --checkpoint_dir /data/deepspeech-0.4.1-checkpoint --learning_rate 0.0001 --export_dir /data/swb/LDC97S62/export4/  --summary_secs=43200 --epoch 60 --checkpoint_secs=43200 --validation_step 1 --lm_alpha 0.75 --lm_beta 1.85 --n_hidden 2048 --checkpoint_step 1 --train_batch_size 12 --dev_batch_size 24 --test_batch_size 24 --dropout_rate 0.15 --display_step 0
```

5. Test your model with the following command:
```
python test.py --model <model file> --alphabet <alphabet file> --lm <language model file> --trie <trie file>
```


