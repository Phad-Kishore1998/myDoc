import numpy as np
from flask import Flask, request, jsonify, render_template
import pickle

app = Flask(__name__, static_folder="C:\Development\WebProjects\AdminPortal\static")
model = pickle.load(open('asthma.pkl', 'rb'))
model2 = pickle.load(open('diabetes.pkl','rb'))
model3 = pickle.load(open('hypoxemia.pkl','rb'))

@app.route('/')
def home():
    return render_template('LoginPage.html')

@app.route("/login",methods=["POST","GET"])
def login():
    if request.method == "POST":
        user = request.form["usernm"]
        return render_template('HomePage.html',usr=user)
    else:
        return render_template("LoginPage.html")
@app.route("/<usr>")
def homepage(usr):
    f"<h1>{usr}</h1>"
    return render_template('HomePage.html')     

@app.route("/dia")
def dia():
  return render_template("DiabetesPage.html")

@app.route("/hypo")
def hypo():
  return render_template("HypoxemiaPage.html")

@app.route("/asth")
def asth():
  return render_template("AsthmaPage.html") 

@app.route("/pre")
def pre():
  return render_template("index.html")                

@app.route('/predict',methods=['POST'])
def predict():
    '''
    return render_template('index.html', prediction_text='Asthma Level $ {}'.format(output))
    For rendering results on HTML GUI
    '''
    int_features = [int(x) for x in request.form.values()]
    final_features = [np.array(int_features)]
    prediction = model.predict(final_features)

    output = round(prediction[0], 2)
    if output==1:
      return render_template('yesasthma.html')
    else:
      return render_template('noasthma.html')

@app.route('/predict2',methods=['POST'])
def predict2():
    '''
    For rendering results on HTML GUI
    '''
    
    int_features = [int(x) for x in request.form.values()]
    final_features = [np.array(int_features)]
    prediction = model2.predict(final_features)

    output2 = round(prediction[0], 2)
    if output2==0:
      return render_template('nodiabetes.html')
    elif output2==1:
      return render_template('yesprediabetes.html')
    else:
      return render_template('yesdiabetes.html')


@app.route('/predict3',methods=['POST'])
def predict3():
    '''
    For rendering results on HTML GUI
    '''
    
    int_features = [int(x) for x in request.form.values()]
    final_features = [np.array(int_features)]
    prediction = model3.predict(final_features)

    output2 = round(prediction[0], 2)
    if output2==1:
      return render_template('nohypoxemia.html')
    else:
      return render_template('yeshypoxemia.html')
    
    
if __name__ == "__main__":
    app.run(debug=True)