## Gen
Gen is simple swift script for generate swift classes for iOS project, for make you more faster, happy and lazy.

![](https://github.com/jantimar/Gen/blob/master/gen.gif)

## Usage
Use one of this command to setup gen and then generate your classes<br />
./gen -author Author							- Set classes author<br />
./gen -samples SampleDirectory					- Set direcotry to samples<br />
./gen -project NameOfProject					- Set project name<br />
<br />
./gen -sc Screen1								- Generate screen<br />
./gen -scf Flow1 Screen1 Screen2 Screen3        - Generate flow with screens<br />
./gen -e Entity1                                - Generate entity<br />
./gen -u UseCase1								- Generate use case<br />
./gen -uf UseCase1 UseCase2 UseCase3 UseCase4	- Generate use case factory and use cases<br />
./gen -se Service1                              - Generate service<br />
./gen -sef Service1 Service2 Service3 Service4  - Generate services factory and services<br />

## Samples
Is there 2 king of samples<br />
Samples - default<br />
Samples2 - entities contains JSON extension and VC contains import SnapKit<br />

## Author
Jan Timar - jantimar2@gmail.com

## Hint
For make it faster and clearly I create genfile.sh<br />
For result look at Contactlist<br />
->

# Setup gen author, project and samples directory
./gen -author "Jan Timar"<br />
./gen -project "Contactlist"<br />
#./gen -samples "/Users/jantimar/Samples/"<br />
./gen -samples "/Users/jantimar/Samples2/"<br />

# Create screens with AppFlow with Contacts AddContact and Orders ViewControllers, Presenters and Protocols
./gen -scf App Contacts AddContact Orders<br />
# Create Contact and Order entities and they Model
./gen -e Contact<br />
./gen -e Order<br />
# Create use cases and they protocols
./gen -uf RefreshContacts LoadContacts Thumbnail AddContact RefreshOrders LoadOrders<br />
# Create services
./gen -sef Api Repo
