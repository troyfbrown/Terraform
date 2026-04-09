console.log('Loading function');

export const handler = async (event, context) => {
    return {
        statusCode: 200,
        headers: { "Content-Type": "application/json"},
        body: JSON.stringify({message: "Another welcome message from Terraform"})
    }
};