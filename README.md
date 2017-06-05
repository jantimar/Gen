## Gen
Gen is simple swift script for generate swift classes for iOS project, for make you more faster, happy and lazy.

![](https://github.com/jantimar/Gen/blob/master/gen.gif)

## Usage
Use one of this command to setup gen and then generate your classes
./gen -author Author							- Set classes author
./gen -samples SampleDirectory					- Set direcotry to samples
./gen -project NameOfProject					- Set project name

./gen -sc Screen1								- Generate screen
./gen -scf Flow1 Screen1 Screen2 Screen3        - Generate flow with screens
./gen -e Entity1                                - Generate entity
./gen -u UseCase1								- Generate use case
./gen -uf UseCase1 UseCase2 UseCase3 UseCase4	- Generate use case factory and use cases
./gen -se Service1                              - Generate service
./gen -sef Service1 Service2 Service3 Service4  - Generate services factory and services

## Samples
Is there 2 king of samples
Samples - default
Samples2 - entities contains JSON extension and VC contains import SnapKit

## Author
Jan Timar - jantimar2@gmail.com

## Hint
For make it faster and clearly I create genfile.sh
For result look at Contactlist
->

# Setup gen
./gen -author "Jan Timar"
./gen -project "Contactlist"
#./gen -samples "/Users/jantimar/Samples/"
./gen -samples "/Users/jantimar/Samples2/"

# Create screens with flow
./gen -scf App Contacts AddContact Orders
# Create entities
./gen -e Contact
./gen -e Order
# Create use cases
./gen -uf RefreshContacts LoadContacts Thumbnail AddContact RefreshOrders LoadOrders
# Create services
./gen -sef Api Repo
