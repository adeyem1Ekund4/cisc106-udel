import json
def deal():
    cards=requests.get("http://tcdealer.cis.udel.edu/api/v1/hands")
    json_data = json.loads(cards.text)
    number = random.randint(0,2196)
    return json_data["hands"] [number] ["cards"]