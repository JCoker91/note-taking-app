docker build -t nta-api:dev .
docker stop nta-api-dev
docker run -d -p 8000:8000 --name nta-api-dev --rm \
                    -e DEBUG=True \
                    -e SECRET_KEY=asdfkeiba \
                    -e DJANGO_SUPERUSER_EMAIL=test@test.com \
                    -e DJANGO_SUPERUSER_PASSWORD=test \
                    nta-api:dev
docker exec nta-api-dev python manage.py migrate
docker exec nta-api-dev python manage.py createsuperuser --noinput