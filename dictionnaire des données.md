###VillageGreen\

##Employee\
-emp_ID(PK)
-emp_name
-emp_lastname
-emp_age
-emp_role
-emp_phoneNumber(unique)
-emp_contactMail(unique)
-emp_companyName
-emp_companyAdress
-emp_companyZipcode
-emp_companyCity

##Supplier\
-sup_ID(PK)
-sup_name
-sup_location
-sup_Zipcode
-sup_city
-sup_phoneNumber(unique)
-sup_contactMail(unique)
-sup_category(constructor, importator)
-sup_refProduct
-sup_productName
-sup_UnitPriceHT

##Product\
-pro_ID
-pro_label
-pro_picture
-pro_description
-pro_EAN
-pro_refSupplier
-pro_color
-pro_dateIn
-pro_dateUpdate
-pro_category
-pro_PriceUnitHt
-pro_Stock
-pro_StockAlert

##Sub_category_product\  
-sub_ID
-sub_name
-sub_quantity

##OrderClient(shop)\  
-ord_ID
-ord_nameClient
-ord_adressShipping
-ord_Zipcode
-ord_city
-ord_shippmentMode
-ord_orderDate
-ord_shippingDate
-ord_paiementMethod
-ord_paiementDate
-ord_receiptAdress (facture)
-ord_receipt(facture)

##Sell_detail(To shop)\  
-sel_ID
-sel_UnitPrice
-sel_quantity
-sel_taxe
-sel_discount
-sel_specialDiscount


#StockOrder(To VillageGreen)\  
-sto_ID
-sto_
-sto_dateCommand
-sto_quantity
-sto_UnitPriceHT
-sto_adressShipping
-sto_Zipcode
-sto_city

##Client\  
-cli_ID
-cli_name
-cli_lastname
-cli_birth
-cli_adress
-cli_Zipcode
-cli_city
-cli_mail
-cli_phoneNumber
-cli_memberName
-cli_newMemberDate
-cli_category

