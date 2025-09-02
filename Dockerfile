# Use a lightweight base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy all files from repo into container
COPY . /app

# Install flask (for a simple web app)
RUN pip install flask

# Create a simple app
RUN echo "from flask import Flask\napp = Flask(__name__)\n@app.route('/')\ndef hello(): return 'Hello from Jenkins + Docker!'\n\nif __name__ == '__main__': app.run(host='0.0.0.0', port=5000)" > app.py

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
