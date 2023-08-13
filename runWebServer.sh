export M2_HOME=$"/Users/dittner/Documents/MAVEN/apache-maven-3.8.6"
export PATH=$PATH:$M2_HOME/bin
echo $PATH

echo "1/2: Building api jar-file..."
cd "api/MondmonolithApi"
mvn clean package -DskipTests

echo "2/2 Running postgres DB and api server..."
cd -
docker-compose -f docker-compose.dev.yml up --build --remove-orphans

echo "Done!"

