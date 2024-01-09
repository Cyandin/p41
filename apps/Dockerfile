# Use a lightweight base image
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /apps

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

# Create a non-root user
RUN useradd -ms /bin/bash appuser

# Copy application code
COPY . .

# Change ownership to the non-root user
RUN chown -R appuser:appuser /apps

# Switch to the non-root user
USER appuser

# Expose the port
EXPOSE 5000

# Command to run the application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "simple_time_service:app"]
