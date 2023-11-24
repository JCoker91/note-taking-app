docker-compose down
docker build -t jcoker91/nta-api:dev backend/.
docker build -t jcoker91/nta-web:dev frontend/.
docker-compose up -d