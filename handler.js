const AWS = require('aws-sdk');

exports.getHello = async (event) => {
    try {
            return {
                statusCode: 200,
                body: `Hello World!!!!!!`
            }
    } catch (e) {
        return {
            statusCode: 200,
            body: 'Error'
        }
    }
}