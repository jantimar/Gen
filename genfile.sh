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
