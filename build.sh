export M2_HOME=$"/Users/dittner/Documents/MAVEN/apache-maven-3.8.6"
export PATH=$PATH:$M2_HOME/bin
echo $PATH

echo
echo "*----------------------------------"
echo "*"
echo "*"
echo "*    1/2: Building api jar-file..."
echo "*"
echo "*"
echo "*----------------------------------"
echo

cd "api/MondmonolithApi"
mvn clean package -DskipTests

echo
echo "*----------------------------------"
echo "*"
echo "*"
echo "*    2/2 Building frontend app..."
echo "*"
echo "*"
echo "*----------------------------------"
echo
cd -
cd "frontend/MondmonolithFrontend"
npm run build

echo "Done!"

