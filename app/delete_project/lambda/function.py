import json


def handler(event, context):
    response = {}
    response['headers'] = {}
    response['headers']['statusCode'] = 204
    response['headers']['Content-Type'] = 'applicaton/json'

    response['body'] = json.dumps('Hello from DELETE-PROJECT lambda!')

    return response