###VillageGreen\
-vil_ID
-vil_Name
-vil_location
-vil_Zipcode
-vil_city

##Employee\
-emp_ID
-emp_name
-emp_lastname
-emp_role

##Supplier\
-sup_ID
-sup_name
-sup_location
-sup_Zipcode
-sup_city
-sup_category(constructor, importator)
-sup_refProduct
-sup_productName
-sup_productCategory
-sup_UnitPriceHT

#Order(To VillageGreen)\  
-ord_vil_ID
-ord_vil_productName
-ord_vil_dateCommand
-ord_vil_quantity
-ord_vil_UnitPriceHT
-ord_vil_adressShipping
-ord_vil_Zipcode
-ord_vil_city

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

##Order_(shop)\  
-ord_name
-ord_adressShipping
-ord_Zipcode
-ord_city
-ord_shippmentMode
-ord_buyDate
-ord_shippingDate
-ord_paiementMethod
-ord_paiementDate
-ord_receiptAdress
-ord_receipt

##Sell_detail(To shop)\  
-sel_ID
-sel_UnitPrice
-sel_quantity
-sel_discount
-sel_specialDiscount

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

