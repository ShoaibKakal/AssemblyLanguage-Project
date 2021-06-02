.MODEL SMALL
.STACK 100H
.DATA

    MSG1 DB 10,13,10,13, '       *****Pakistan LUMBER 1 Restaurant ****$'
    
    MSG2 DB 10,13, ' **           1. BreakFast Menue          **$'
    MSG3 DB 10,13, ' **           2. Lunch Menue              **$'
    MSG4 DB 10,13, ' **           3. Dinner Menue             **$'
    MSG5 DB 10,13, ' **           4. Snacks Menue             **$'
    MSG7 DB 10,13, ' **           5. Drinks                   **$' 
      
    
    
    
    MSG9 DB 10,13,10,13, ' ****Choose Your Food From the menu****$'
    
    
    ;BreakFast
    
    MSG10 DB 10,13, ' **                1.Tanduri Roti          10rs.               **$'
    MSG11 DB 10,13, ' **                2.Parata                10rs.               **$'
    MSG12 DB 10,13, ' **                3.Vegetables            20rs.               **$'
    MSG12b DB 10,13,' **                4.Halwa                 30rs.               **$'
    MSG13 DB 10,13, ' **                5.Fried Egg             20rs.               **$'
    MSG14 DB 10,13, ' **                6.Sandwich              20rs.               **$'
    
    
    
    ;Lunch
    
    MSG15 DB 10,13, ' **                 1.Chicken Biryani       60rs.              **$'
    MSG16 DB 10,14, ' **                 2.Plain Polaw           90rs.              **$'
    MSG17 DB 10,15, ' **                 3.Chicken               50rs.              **$'
    MSG18 DB 10,16, ' **                 4.Mutton                60rs.              **$'
    MSG19 DB 10,17, ' **                 5.White Rice            40rs.              **$'
    MSG20 DB 10,18, ' **                 6.Fish                  50rs.              **$'




    ;Dinner
    MSG21 DB 10,13, ' **                 1.Lamb Burger           90rs.              **$'
    MSG22 DB 10,13, ' **                 2.Mexican Rice          60rs.              **$'
    MSG23 DB 10,13, ' **                 3.Chicken               50rs.              **$'
    MSG24 DB 10,13, ' **                 4.Fish                  30rs.              **$'
    MSG25 DB 10,13, ' **                 5.Mutton Steak          50rs.              **$'
    
    
    
    ;Snacks
    MSG26 DB 10,13, ' **                 1.Cheeots               20rs.              **$'
    MSG27 DB 10,13, ' **                 2.Dorites               40rs.              **$'
    MSG28 DB 10,13, ' **                 3.Chickenroast          50rs.              **$'
    MSG29 DB 10,13, ' **                 4.Popchips              40rs.              **$'
    MSG30 DB 10,13, ' **                 5.GoldFish              50rs.              **$'
    
    
    
    ;Drinks
    MSG31 DB 10,13, ' **                 1.Pepsi                 30rs.              **$'
    MSG32 DB 10,13, ' **                 2.Fanta                 40rs.              **$'   
    MSG33 DB 10,13, ' **                 3.Coffee                30rs.              **$'
    MSG34 DB 10,13, ' **                 4.Tea                   30rs.              **$'
    
    
    
    ;Invalid input
    MSG_INVALID DB 10,13,10,13, '**** INVALID ENTRY   ****$'
    MSG_TRYAGAIN DB 10,13,10,13, '****  Try Again  ****$'
                                        
    
    BOARDER1 DB 10,13, ' **                                       **$'
    BOARDER2 DB 10,13,' *******************************************$'
    BOARDER3 DB 10,13,' ****************************************************************$'
    BOARDER4 DB 10,13,' **                                                            **$' 
    LINE DB 10,13,' $'   
    
    
   
    MSG_CHOICE DB     10,13,10,13, ' Enter Your Choice:  $'
    MSG_ORDER DB      10,13,10,13, 'Enter Your Order:  $'
    MSG_QUANTITY DB   10,13,10,13, 'Quantity: $'
    MSG_TOTAL DB      10,13,10,13, 'Total Price: $' 
    
    
    MSG_GOTO_MAIN DB 10,13,10,13, '1.Go Back to Main Menue $'
    MSG_EXIT      DB 10,13,10,13, '2.Exit$'
     
      

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX   
    
    
    
    ;Procedures & Macros
    
    stringPrint MACRO P1  
        LEA DX, P1
        MOV AH, 9
        INT 21H 
        
    ENDM
    
    
    
        
    
    
    TOP:
        stringPrint MSG1
        stringPrint LINE
        stringPrint BOARDER2
        stringPrint BOARDER2
        stringPrint BOARDER1      
        stringPrint MSG2
        stringPrint MSG3
        stringPrint MSG4
        stringPrint MSG5
        stringPrint MSG7
        stringPrint BOARDER1
        stringPrint BOARDER2
        stringPrint BOARDER2 
        stringPrint MSG_CHOICE         
        
        MOV AH, 1
        INT 21H
        MOV BL, AL   
        SUB BL, 48
        
        CMP BL, 1
        JE BREAKFAST
        
        CMP BL, 2
        JE LUNCH
        
        CMP BL, 3
        JE DINNER
                  
        CMP BL, 4
        JE SNACKS
        
        CMP BL, 5
        JE DRINKS
         
        JMP INVALID
        
        
        
        
        
    
    
    
    BREAKFAST:
        stringPrint MSG9
        stringPrint LINE
        stringPrint BOARDER3
        stringPrint BOARDER3
        stringPrint BOARDER4
        stringPrint MSG10   
        stringPrint MSG11
        stringPrint MSG12
        stringPrint MSG12b
        stringPrint MSG13
        stringPrint MSG14
        stringPrint BOARDER4
        stringPrint BOARDER3 
        stringPrint BOARDER3 
        
        stringPrint MSG_ORDER
        
        MOV AH,1
        INT 21H
        MOV BL, AL
        SUB BL, 48              
        
        
        CMP BL, 1
        JE TEN 
        
        CMP BL, 2
        JE TEN
        
        CMP BL, 3
        JE TWENTY
        
        CMP BL, 4
        JE THIRTY
        
        CMP BL, 5
        JE TWENTY
        
        CMP BL, 6
        JE TWENTY
        
        
        JMP INVALID
        
        
        

    
    LUNCH:
        stringPrint MSG9
        stringPrint LINE
        stringPrint BOARDER3
        stringPrint BOARDER3
        stringPrint BOARDER4
        stringPrint MSG15   
        stringPrint MSG16
        stringPrint MSG17
        stringPrint MSG18
        stringPrint MSG19
        stringPrint MSG20
        stringPrint BOARDER4
        stringPrint BOARDER3 
        stringPrint BOARDER3 
        
        stringPrint MSG_ORDER
                            
        MOV AH, 1
        INT 21H
        MOV BL, AL
        SUB BL, 48
        
        
        CMP BL, 1
        JE SIXETY
        
        CMP BL, 2
        JE NINETY
        
        CMP BL, 3
        JE FIFTY
        
        CMP BL, 4
        JE SIXETY
        
        CMP BL, 5
        JE FOURTY
        
        CMP BL, 6
        JE FIFTY
        
        JMP INVALID  
                              
                              
                              
                              
    DINNER:                              
        stringPrint MSG9
        stringPrint LINE
        stringPrint BOARDER3
        stringPrint BOARDER3
        stringPrint BOARDER4
        stringPrint MSG21   
        stringPrint MSG22
        stringPrint MSG23
        stringPrint MSG24
        stringPrint MSG25
        stringPrint BOARDER4
        stringPrint BOARDER3 
        stringPrint BOARDER3
        
        stringPrint MSG_ORDER 
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
        SUB BL, 48
        
        
        CMP BL, 1
        JE NINETY
        
        CMP BL, 2
        JE SIXETY
        
        CMP BL, 3
        JE FIFTY
        
        CMP BL, 4
        JE THIRTY
        
        CMP BL, 5
        JE FIFTY
        
        
        JMP INVALID
        
        
        



    SNACKS:
        stringPrint MSG9
        stringPrint LINE
        stringPrint BOARDER3
        stringPrint BOARDER3
        stringPrint BOARDER4
        stringPrint MSG26   
        stringPrint MSG27
        stringPrint MSG28
        stringPrint MSG29
        stringPrint MSG30
        stringPrint BOARDER4
        stringPrint BOARDER3 
        stringPrint BOARDER3 
        
        stringPrint MSG_ORDER
        
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
        SUB BL, 48
        
        
        CMP BL, 1
        JE THIRTY
        
        CMP BL, 2
        JE FOURTY
        
        CMP BL, 3
        JE FIFTY
        
        CMP BL, 4
        JE FOURTY
        
        CMP BL, 5
        JE FIFTY
        
        JMP INVALID          
    


    DRINKS:
        stringPrint MSG9
        stringPrint LINE
        stringPrint BOARDER3
        stringPrint BOARDER3
        stringPrint BOARDER4
        stringPrint MSG31   
        stringPrint MSG32
        stringPrint MSG33
        stringPrint MSG34
        stringPrint BOARDER4
        stringPrint BOARDER3 
        stringPrint BOARDER3 
        
        stringPrint MSG_ORDER
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
        SUB BL, 48
        
        
        CMP BL, 1
        JE THIRTY
        
        CMP BL, 2
        JE FOURTY
        
        CMP BL, 3
        JE THIRTY
        
        CMP BL, 4
        JE THIRTY
        
        JMP INVALID 
        
    INVALID:
        stringPrint MSG_INVALID
        stringPrint MSG_TRYAGAIN
        
        JMP EXIT
    
    
    
    
                
                
    TEN:
        MOV BL, 1
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT
                             
                 
                 
                 
                     
        

    TWENTY:
        MOV BL, 2
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT
        
        
        
                 
                 
                 
                 
    
    
    THIRTY:
        MOV BL, 3
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT
                 
                 
                 
                 


    
    FOURTY:
        MOV BL, 4
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT


              
              
              
              
    
    FIFTY:
        MOV BL, 5
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT
                 
                 
                 
                 
                 
    
    SIXETY:
        MOV BL, 6
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT
    
    

                 
                 
                 
                 

    
    SEVENTY:
        MOV BL, 7
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT
        
        
        

    EIGHTY:
        MOV BL, 8
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT               
    
    
    
    

   NINETY:
        MOV BL, 9
        stringPrint MSG_QUANTITY
        
        MOV AH,1
        INT 21H
        SUB AL, 48
        
        MUL BL
        AAM
        
        MOV CX, AX
        ADD CH, 48
        ADD CL, 48
        
        stringPrint MSG_TOTAL
        
        MOV AH, 2
        MOV DL, CH
        INT 21H
        
        MOV DL, CL
        INT 21H
        
        MOV DL, '0'
        INT 21H
        
        
        ;FOR Rs. print
        
        MOV DL, 'r'
        INT 21H
        MOV DL, 's'
        INT 21H
        MOV DL, '.'
        INT 21H
        
        
        ;GO back to Main Menu
        stringPrint MSG_GOTO_MAIN
        stringPrint MSG_EXIT
        stringPrint MSG_CHOICE
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        
        CMP AL, 1
        JE TOP
        
        JMP EXIT    

               
    
    
               
    EXIT:
        MOV AH, 4CH
        INT 21H           
    
    
    
MAIN ENDP
END MAIN