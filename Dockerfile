# Start with a base Python image that includes Python 3.11.
FROM python:3.11-slim

# Set the working directory inside the container. All commands will run from here.
WORKDIR /app

# Copy the requirements file into the container.
COPY requirements.txt .

# Install all the Python libraries listed in requirements.txt.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app's files (including protein_predictor.py) into the container.
COPY . .

# Expose the port where your Streamlit app will be running (default is 8501).
EXPOSE 8501

# The command that Docker should run when the container starts.
CMD ["streamlit", "run", "protein_predictor.py"]