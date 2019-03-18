from flask import send_file,Flask
app = Flask(__name__)


@app.route('/download_model')
def return_files_tut():
	try:
		return send_file('output_graph.pb', attachment_filename='output_graph.pb')
	except Exception as e:
		return str(e)
