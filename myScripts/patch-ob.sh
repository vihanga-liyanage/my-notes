echo "Remove consent folder"
rm -rf /home/vihanga/Downloads/wso2-ob-solution-1.0.0/wso2-ob-km-5.5.0/repository/deployment/server/webapps/consent/
echo "Replace consent.war"
cp /home/vihanga/WSO2-Projects/6.ob-berlin-spec-pcm-flow/projects/payment-cnsnt-impl-2/financial-open-banking/artifacts/consent-mgt/ob-berlin/1.0.0/components/com.wso2.finance.open.banking.consent.mgt.endpoint.berlin.v100/target/consent.war /home/vihanga/Downloads/wso2-ob-solution-1.0.0/wso2-ob-km-5.5.0/repository/deployment/server/webapps/
echo "Replace mgt.jar"
cp /home/vihanga/WSO2-Projects/6.ob-berlin-spec-pcm-flow/projects/payment-cnsnt-impl-2/financial-open-banking/artifacts/consent-mgt/ob-berlin/1.0.0/components/com.wso2.finance.open.banking.consent.mgt.berlin.v100/target/com.wso2.finance.open.banking.consent.mgt.berlin.v100-1.1.0-M4-SNAPSHOT.jar /home/vihanga/Downloads/wso2-ob-solution-1.0.0/wso2-ob-km-5.5.0/repository/components/dropins/
echo "Done..."