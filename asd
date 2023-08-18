import requests

number = input("Enter your number : ")
print()
pwd = input("Enter your password : ")
print()
member = input("Enter the number member : ")

url = 'https://mobile.vodafone.com.eg/auth/realms/vf-realm/protocol/openid-connect/token'

headers = {"Accept": "application/json, text/plain, */*",
    "Connection": "keep-alive",
    "x-agent-operatingsystem": "10.1.0.264C185",
    "clientId": "AnaVodafoneAndroid",
    "x-agent-device": "HWDRA-MR",
    "x-agent-version": "2022.1.2.3",
    "x-agent-build": "500",
    "Content-Type": "application/x-www-form-urlencoded",
    "Content-Length": "142",
    "Host": "mobile.vodafone.com.eg",
    "Accept-Encoding": "gzip",
    "User-Agent": "okhttp/4.9.1"}

data = 'username='+number+'&password='+pwd+'&grant_type=password&client_secret=a2ec6fff-0b7f-4aa4-a733-96ceae5c84c3&client_id=my-vodafone-app'
verify = requests.post(url, headers=headers, data=data).json()
if 'access_token' in verify:
    token = verify['access_token']
    h1 = {
"hash":"Ssodq4JtQ1FR09mO0I50oJs5RN3ymtcE8VjKdRmfPJQ=",
"Authorization":f"Bearer {token}",
"Host":"mobile.vodafone.com.eg",
"Connection":"Keep-Alive",
}

    d1 = '{"familyType":"red","memberMsisdn":"%s","miLimit":100,"packageID":"6174","templateID":"617","tierID":"6174","voiceLimit":100}'%(member)

    res = requests.post("https://mobile.vodafone.com.eg/mobile-app/familyManagment/sendInvitation",headers =h1, data =d1)
    print(res.text)
else:
    print("Wrong password")
    exit()
