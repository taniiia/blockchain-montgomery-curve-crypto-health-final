#chmod -R 0755 ./crypto-config
# Delete existing artifacts
#rm -rf ./crypto-config
#rm genesis.block mychannel.tx
#rm -rf ../../channel-artifacts/*

#Generate Crypto artifactes for organizations
#cryptogen generate --config=./crypto-config.yaml --output=./crypto-config/

# System channel
SYS_CHANNEL="sys-channel"
REG_CHANNEL="registration-channel"
PM_CHANNEL="patient-medication-channel"
BILL_CHANNEL="billing-channel"
COMM_CHANNEL="communication-channel"

# #create channel-artifacts if not present
# mkdir -p ./channel-artifacts

# #Generate System Genesis block 
# echo "Generating genesis block for system channel ($SYS_CHANNEL)..."
# configtxgen -profile HospitalOrdererGenesis -configPath . -channelID $SYS_CHANNEL -outputBlock ./channel-artifacts/genesis.block

# #Generate channel configuration transactions for each channel
# echo "Generating channel configuration block for Registration Channel ($REG_CHANNEL)..."
# configtxgen -profile RegistrationChannel -configPath . -channelID $REG_CHANNEL -outputCreateChannelTx ./channel-artifacts/registration-channel.tx

# echo "Generating channel configuration block for Patient Medication Channel  ($PM_CHANNEL)..."
# configtxgen -profile PatientMedicationChannel -configPath . -channelID $PM_CHANNEL -outputCreateChannelTx ./channel-artifacts/patient-medication-channel.tx

# echo "Generating channel configuration block for Billing Channel ($BILL_CHANNEL)..."
# configtxgen -profile BillingChannel -configPath . -channelID $BILL_CHANNEL -outputCreateChannelTx ./channel-artifacts/billing-channel.tx

# echo "Generating channel configuration block for Communication Channel ($COMM_CHANNEL)..."
# configtxgen -profile CommunicationChannel -configPath . -channelID $COMM_CHANNEL -outputCreateChannelTx ./channel-artifacts/communication-channel.tx


echo "#### Generating anchor peer update for PESUHospitalBLRMSP #####"
configtxgen -profile RegistrationChannel -configPath . -channelID $REG_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalBLRMSPanchors_registration.tx -asOrg PESUHospitalBLRMSP

configtxgen -profile PatientMedicationChannel -configPath . -channelID $PM_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalBLRMSPanchors_patient_medication.tx -asOrg PESUHospitalBLRMSP

configtxgen -profile BillingChannel -configPath . -channelID $BILL_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalBLRMSPanchors_billing.tx -asOrg PESUHospitalBLRMSP

configtxgen -profile CommunicationChannel -configPath . -channelID $COMM_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalBLRMSPanchors_communication.tx -asOrg PESUHospitalBLRMSP


echo "#### Generating anchor peer update for PESUHospitalKPMMSP #####"
configtxgen -profile RegistrationChannel -configPath . -channelID $REG_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalKPMMSPanchors.tx -asOrg PESUHospitalKPMMSP

configtxgen -profile PatientMedicationChannel -configPath . -channelID $PM_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalKPMMSPanchors_patient_medication.tx -asOrg PESUHospitalKPMMSP

configtxgen -profile BillingChannel -configPath . -channelID $BILL_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalKPMMSPanchors_billing.tx -asOrg PESUHospitalKPMMSP

configtxgen -profile CommunicationChannel -configPath . -channelID $COMM_CHANNEL -outputAnchorPeersUpdate ./channel-artifacts/PESUHospitalKPMMSPanchors_communication.tx -asOrg PESUHospitalKPMMSP



# # channel name defaults to "mychannel"
# CHANNEL_NAME="mychannel"

# echo $CHANNEL_NAME

# Generate System Genesis block
# configtxgen -profile OrdererGenesis -configPath . -channelID $SYS_CHANNEL  -outputBlock ./genesis.block


# # Generate channel configuration block
# configtxgen -profile BasicChannel -configPath . -outputCreateChannelTx ./mychannel.tx -channelID $CHANNEL_NAME

# echo "#######    Generating anchor peer update for Org1MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

# echo "#######    Generating anchor peer update for Org2MSP  ##########"
# configtxgen -profile BasicChannel -configPath . -outputAnchorPeersUpdate ./Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP