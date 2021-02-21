import requests

url = 'http://localhost:5000/predict_api'
r = requests.post(url,json={'experience':2, 'test_score':9, 'interview_score':6})
r2 = requests.post(url,json={'experience':2})
r3 = requests.post(url,json={'experience':3})

print(r.json())