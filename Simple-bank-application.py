import pymysql
connection=pymysql.connect('localhost','root','','mybank')
cur=connection.cursor()
# for transactions
#----------------------------------#
#----------------------------------#
#----------------------------------#
def AdminsignIn():
    print("*-------------------SIGN IN-----------------------*")
    userid=input("ENter the userid: ")
    passwd=input("Enter the password: ")
    query="SELECT AdminName, AdminPasswd FROM admin"
    cur.execute(query)
    rows=cur.fetchall()
    if (userid,passwd) in rows:
        print("access granted")
    else:
        input("Wrong credentials......try again?")
        return
    while True:
        ch=int(input("Enter your choice:\n1.Print closed account history\n2.FD Report of a Customer\n\
3.FD Report of Customers vis-à-vis another Customer:\n4.FD Report of Customers w.r.t a particular FD Amount:\n\
5.Loan Report of a Customer\n6.Loan Report of Customers vis-à-vis another Customer\n\
7.Loan Report of Customers w.r.t a particular Loan Amount\n8.Loan – FD Report of Customers\n\
9.Report of Customers who are yet to avail a loan\n\
10.Report of Customers who are yet to open a FD account\n\
11.Report of Customers who neither have a loan nor a FD account with the bank\n \
0.LogOut\nSubmit: \n"))
        if ch==1:
            query="SELECT Acc_no, Acc_type, Acc_balance  FROM account WHERE deleted='1'"
            print("Closed Accounts history\n\n")
            print("Acc_no\tAcc_type\tAcc_bal")
            cur.execute(query)
            r=cur.fetchall()
            print("______________________________________________________________________________________________________________")
            for i in r:
                print(i[0],"\t",i[1],"\t\t",i[2])
                print("______________________________________________________________________________________________________________")
        elif ch==2:
            cid=int(input("Enter the cust_id :"))
            cur.execute("SELECT FD_Acc_no, FD_Amount, FD_term FROM fixed_deposits WHERE  Acc_no=%s",str(cid))
            r1=cur.fetchall()
            try:
                if r1[0]==None:
                    print("N.A")
            except:
                print("N.A")
            print("FD_Acc_no     FD_Amount     FD_term")
            print("______________________________________________________________________________________________________________")
            for row in r1:
                print(row[0],"\t    ",row[1],"\t      ",row[2],"\t    ")
                print("______________________________________________________________________________________________________________")
        elif ch==3:
            cid=int(input("Enter the cust_id :"))
            cur.execute("SELECT * FROM fixed_deposits WHERE  Acc_no=%s",str(cid))
            r1=cur.fetchall()
            if r1==None:
                print("no FDs for the selected customer")
                break
            else:
                sum=0
                i=1
                for rows in r1:
                    sum+=rows[2]
                print("sum=",sum)
                query="SELECT * FROM fixed_deposits"
                cur.execute(query)
                r2=cur.fetchall()
                print("Slno\t\tFD_Acc_no\t\tAcc_no\t\tFD_amount\t\tFD_term")
                print("______________________________________________________________________________________________________________")
                for rows in r2:
                    if rows[2]>sum:
                        print(i,".            ",rows[0],"\t               ",rows[1],"\t        ",rows[2],"\t       ",rows[3],"\n")
                        print("______________________________________________________________________________________________________________")
                        i+=1
        elif ch==4:
            amtt=int(input("Enter the amount "))
            if amtt<1000 or amtt%1000!=0:
                print("Invalid input")
            else:
                cur.execute("SELECT F.Acc_no,C.cust_first_name,C.cust_second_name, F.FD_Amount FROM fixed_deposits F,customers C WHERE  F.FD_Amount>%s AND C.cust_id=F.Acc_no",str(amtt))
                r1=cur.fetchall()
                print("Cust_id\tFirst_name\tSecond_name\tFD_Amount\t")
                print("______________________________________________________________________________________________________________")
                for rows in r1:
                    print(rows[0],"\t",rows[1],"\t\t  ",rows[2],"\t",rows[3],"\t")
                    print("______________________________________________________________________________________________________________")
        elif ch==5:
            cid=int(input("Enter the cust_id :"))
            cur.execute("SELECT Loan_Acc_no, LoanAmt, Loan_term FROM loans WHERE  Acc_no=%s",str(cid))
            r1=cur.fetchall()
            try:
                if r1[0]==None:
                    print("Not Availed..")
            except:
                print("Not Availed..")
            print("Loan_Acc_no     Loan_Amount     Loan_term(in months)")
            print("______________________________________________________________________________________________________________")
            for row in r1:
                print(row[0],"\t        ",row[1],"\t        ",row[2],"\t    ")
                print("______________________________________________________________________________________________________________")
        elif ch==6:
            cid=int(input("Enter the cust_id :"))
            cur.execute("SELECT Loan_Acc_no, LoanAmt, Loan_term FROM loans WHERE  Acc_no=%s",str(cid))
            r1=cur.fetchall()
            try:
                if r1[0]==None:
                    print("Not Availed..")
            except:
                print("Not Availed..")
            sum=0
            for rows in r1:
                sum+=rows[1]
            cur.execute("SELECT Loan_Acc_no, LoanAmt, Loan_term FROM loans WHERE NOT  Acc_no=%s AND LoanAmt>%s",(str(cid),str(sum)))
            r2=cur.fetchall()
            print("Loan_Acc_no\tLoan_Amt\tLoan_term")
            print("______________________________________________________________________________________________________________")
            for rows in r2:
                print(rows[0],"\t      ",rows[1],"\t       ",rows[2],"\t")
                print("______________________________________________________________________________________________________________")
        elif ch==7:
            amtt=int(input("Enter the amount "))
            if amtt<1000 or amtt%1000!=0:
                print("Invalid input")
            else:
                cur.execute("SELECT L.Acc_no,C.cust_first_name,C.cust_second_name, L.LoanAmt FROM loans L,customers C WHERE  L.LoanAmt>%s AND C.cust_id=L.Acc_no",str(amtt))
                r1=cur.fetchall()
                print("Cust_id\tFirst_name\tSecond_name\tLoan_Amount\t")
                print("______________________________________________________________________________________________________________")
                for rows in r1:
                    print(rows[0],"\t",rows[1],"\t\t   ",rows[2],"\t\t",rows[3],"\t")
                    print("______________________________________________________________________________________________________________")
        elif ch==8:
            query="SELECT c.cust_id,c.cust_first_name,c.cust_second_name,CAST(sum(l.LoanAmt) AS int),cast(SUM(f.FD_Amount) AS int) from fixed_deposits f,loans l,customers c WHERE c.cust_id=f.Acc_no AND f.Acc_no=l.Acc_no GROUP BY c.cust_id"
            cur.execute(query)
            r1=cur.fetchall()
            print("Cust_id   \t FirstName  \t LastName   \t SumOfLoans  \t SumOfFDs")
            print("______________________________________________________________________________________________________________")
            for rows in r1:
                if rows[3]>rows[4]:
                    print(rows[0],"\t    ",rows[1],"\t     ",rows[2],"\t    ",rows[3],"\t    ",rows[4],"\t")
                    print("______________________________________________________________________________________________________________")
        elif ch==9:
            cur.execute("SELECT account.Acc_no,c.cust_first_name,c.cust_second_name FROM account,customers c WHERE Acc_no NOT IN \
            (SELECT Acc_no FROM loans GROUP by Acc_no) AND account.Acc_no=c.cust_id")
            r1=cur.fetchall()
            print("Cust_ID   \t FirstNAme  \t LastName ")
            print("______________________________________________________________________________________________________________")
            for rows in r1:
                print(rows[0],"\t  \t",rows[1],"\t",rows[2])
                print("______________________________________________________________________________________________________________")
        elif ch==10:
            query="SELECT account.Acc_no,c.cust_first_name,c.cust_second_name FROM account,customers c WHERE\
            Acc_no NOT IN (SELECT Acc_no FROM fixed_deposits GROUP by Acc_no) AND account.Acc_no=c.cust_id"
            cur.execute(query)
            r1=cur.fetchall()
            print("Cust_ID   \t FirstNAme      \t LastName ")
            print("______________________________________________________________________________________________________________")
            for rows in r1:
                print(rows[0],"\t   ",rows[1],"\t   ",rows[2])
                print("______________________________________________________________________________________________________________")
        elif ch==11:
            cur.execute("SELECT * FROM (SELECT c.cust_id,c.cust_first_name,c.cust_second_name FROM customers c,account a WHERE c.cust_id NOT IN (SELECT Acc_no FROM loans GROUP by Acc_no) AND a.Acc_no=c.cust_id) as x, (SELECT c.cust_id,c.cust_first_name,c.cust_second_name FROM customers c,account a WHERE c.cust_id NOT IN (SELECT Acc_no FROM fixed_deposits GROUP by Acc_no) AND a.Acc_no=c.cust_id) as y WHERE x.cust_id=y.cust_id")
            r1=cur.fetchall()
            print("Cust_ID   \t FirstNAme      \t LastName ")
            print("______________________________________________________________________________________________________________")
            for rows in r1:
                print(rows[0],"\t   ",rows[1],"\t   ",rows[2])
                print("______________________________________________________________________________________________________________")
        elif ch==0:
            return
def acc_trans(userid):
    cur.execute("SELECT cust_id FROM user_credentials WHERE userid=%s",str(userid))
    Acc_no=cur.fetchall()
    print("Account No.:",Acc_no[0][0])
    while True:
        ch=int(input("1.Address Change\n2.Open New Account\n3.Money Deposit\n4.Money Withdrawl\n5.Transfer Money\n\
6.Print Statement\n7.Account Closure\n8.Avail Loan\n0.Logout\n"))
        if ch==1:
            Addr_1=input("Enter address line 1")
            Addr_2=input("Enter address line 2")
            city=input("city")
            state=input("State")
            pincode=int(input("Pincode"))
            cur.execute("UPDATE customers SET Addr_line1=%s,Addr_line2=%s,city=%s\
            ,state=%s,Pincode=%s WHERE cust_id=%s",(Addr_1,Addr_2,city,state,str(pincode),str(Acc_no[0][0])))
            print("Address Updated..........")
            connection.commit()
        elif ch==2:
            while True:
                sel=int(input("1.Create a new FD account\n 2.Check your FD account status\n3.Back to main menu"))
                if sel==1:
                    FDamt=int(input("Enter the FD amount:"))
                    term=int(input("Enter the term in (months) "))
                    if FDamt<1000 or (FDamt%1000!=0):
                        print("\n******Rs.1000 is the least amount to apply and should be in multiples of 1000 for FD Account******\n")
                    elif term<12:
                        print("******Term should be for of atleast 12 months*******")
                    else:
                        cur.execute("INSERT INTO fixed_deposits(Acc_no, FD_Amount,FD_term) VALUES (%s,%s,%s)",(str(Acc_no[0][0]),str(FDamt),str(term)))
                        connection.commit()
                        cur.execute("SELECT FD_Acc_no,FD_Amount, FD_term FROM fixed_deposits where Acc_no=%s",str(Acc_no[0][0]))
                        FD_details=cur.fetchall()
                        print("\nFD Account No.",FD_details[-1][0])
                        print("FD Amount     ",FD_details[-1][1])
                        print("FD Term       ",FD_details[-1][2],"\n")
                        break;
                elif sel==2:
                    cur.execute("SELECT FD_Acc_no, FD_Amount,FD_term FROM fixed_deposits WHERE Acc_no=%s",str(Acc_no[0][0]))
                    r=cur.fetchall()
                    print("FD_ACCOUNT_NO\tFD_AMOUNT\tFD_TERM")
                    for rows in r:
                        print(rows[0],"\t\t",rows[1],"\t\t",rows[2])
                elif sel==3:
                    break
        elif ch==3:
            cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
            Avail_bal=cur.fetchall()
            print("Your current balance is Rs."+str(Avail_bal[0][0]))
            amt=int(input("Enter the amount to deposit "))
            cur.execute("UPDATE account SET Acc_balance=Acc_balance+%s WHERE Acc_no=%s",(str(amt),str(Acc_no[0][0])))
            connection.commit()
            cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
            Avail_bal=cur.fetchall()
            print("Your current balance is Rs."+str(Avail_bal[0][0]))
            cur.execute("INSERT INTO transactions(Acc_no,TransType, AmountOfTrans, ToAcc, Acc_balance, time) VALUES (%s,'DEPOSIT',%s,%s,%s,now())",(str(Acc_no[0][0]),str(amt),str(Acc_no[0][0]),str(Avail_bal[0][0])))
            connection.commit()
        elif ch==4:
            cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
            Avail_bal=cur.fetchall()
            print("Your current balance is Rs."+str(Avail_bal[0][0]))
            amt=int(input("Enter the amount to Withdraw "))
            cur.execute("UPDATE account SET Acc_balance=Acc_balance-%s WHERE Acc_no=%s",(str(amt),str(Acc_no[0][0])))
            connection.commit()
            cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
            Avail_bal=cur.fetchall()
            print("Your current balance is Rs."+str(Avail_bal[0][0]))
            cur.execute("INSERT INTO transactions(Acc_no,TransType, AmountOfTrans, ToAcc, Acc_balance, time) VALUES (%s,'WITHDRAWN',%s,%s,%s,now())",(str(Acc_no[0][0]),str(amt),str(Acc_no[0][0]),str(Avail_bal[0][0])))
            connection.commit()
        elif ch==5:
            amt=int(input("Enter the amount to tranfer "))
            cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
            Avail_bal=cur.fetchall()
            for row1 in Avail_bal:
                print("Your current balance is Rs."+str(row1[0]))
            if row1[0]<amt:
                print("Insufficient funds to transfer")
            else:
                acc2=int(input("Enter the account no. to tranfer to."))
                cur.execute("UPDATE account SET Acc_balance=(Acc_balance-%s)  WHERE Acc_no=%s",(str(amt),str(Acc_no[0][0])))
                cur.execute("UPDATE account SET Acc_balance=Acc_balance+%s WHERE Acc_no=%s",(str(amt),str(acc2)))
                connection.commit()
                print("The amount of Rupees "+str(amt)+" successfully transferred to Account no. "+str(acc2))
                cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
                Avail_bal=cur.fetchall()
                for row1 in Avail_bal:
                    print("Your current balance is Rs."+str(row1[0]))
                cur.execute("INSERT INTO transactions(Acc_no,TransType, AmountOfTrans, ToAcc, Acc_balance, time) VALUES (%s,'DEBIT',%s,%s,%s,now())",(str(Acc_no[0][0]),str(amt),str(acc2),str(row1[0])))
                cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(acc2))
                Avail_bal=cur.fetchall()
                for row1 in Avail_bal:print()
                cur.execute("INSERT INTO transactions(Acc_no,TransType, AmountOfTrans, ToAcc, Acc_balance, time) VALUES (%s,'CREDIT',%s,%s,%s,now())",(str(acc2),str(amt),str(Acc_no[0][0]),str(row1[0])))
            connection.commit()
        elif ch==6:
            query="SELECT trans_id,AmountOfTrans,TransType, ToAcc, Acc_balance, time FROM transactions WHERE Acc_no="+str(Acc_no[0][0])
            cur.execute(query)
            r1=cur.fetchall()
            heading="trans_id     AmountOfTrans     TransType     ToAcc     Acc_balance     time"
            print(heading)
            print("______________________________________________________________________________________________________________")
            for row in r1:
                print(row[0],"\t    ",row[1],"\t      ",row[2],"\t    ",row[3],"\t      ",row[4],"\t      ",row[5])
                print("______________________________________________________________________________________________________________")
            connection.commit()
        elif ch==7:
            cur.execute("UPDATE `account` SET `locked|unlocked`=0,`Acc_status`=0,`deleted`=1 WHERE `Acc_no`=%s",str(Acc_no[0][0]))
            connection.commit()
            print("Your account is closed...........")
        elif ch==8:
            cur.execute("SELECT Loan_Acc_no, LoanAmt, Loan_term FROM loans WHERE Acc_no=%s",str(Acc_no[0][0]))
            r1=cur.fetchall()
            print("Loan_Acc_no    Loan_Amt       Loan_Trem")
            print("______________________________________________________________________________________________________________")
            for row in r1:
                print(row[0],"\t       Rs.",row[1],"\t   ",row[2],"\t    ")
                print("______________________________________________________________________________________________________________")
            while True:
                opt=input("New Loan ? (Y or N)")
                if opt=='Y':
                    Lamt=int(input("\nEnter loan amt :\n"))
                    if Lamt<1000or(Lamt%1000==0):
                        cur.execute("SELECT Acc_balance FROM account WHERE Acc_no=%s",str(Acc_no[0][0]))
                        Avail_bal=cur.fetchall()
                        if Lamt<=2*Avail_bal[0][0]:
                            R_term=int(input("Enter repayment term(in months) :"))
                            cur.execute("INSERT INTO loans(Acc_no, LoanAmt, Loan_term) VALUES (%s,%s,%s)",(str(Acc_no[0][0]),str(Lamt),str(R_term)))
                            print("Loan granted..................")
                            connection.commit()
                            break
                        else:
                            print("You don't have enough balance to avail loan for amount ",Lamt)
                    else:
                        print("Loan amt should be in multiples of 1000s")
                else:break;
        elif ch==0:
            return            
def start():
    TrailLimit=1
    while True:
        if TrailLimit>3:
            print("U've reached maximum login limit for the day...........\n*------------Please try after 24hrs.--------------*")
            return
        ch=int(input("ENter ur choice\n1.Sign In\t2.New Account?-->Sign Up\n3.Admin signin\n"))
        if ch==1:
            TL=signin()
            if TL==0:
                TrailLimit+=1
        elif ch==2:    
            signup()
        elif ch==3:
            AdminsignIn()
        else:
            print("Invalid Input")
            break;
# sign in
#---------------------------------------------#
#---------------------------------------------#
#---------------------------------------------#
def signin():
    print("*-------------------SIGN IN-----------------------*")
    print("(Enter 0 any time to go Back)")
    userid=input("ENter the userid: ")
    if userid=='0':
        return 0
    passwd=input("Enter the password: ")
    if passwd=='0':
        return 0
    query="SELECT userid,passwd FROM user_credentials"
    cur.execute(query)
    rows=cur.fetchall()
    if (userid,passwd) in rows:
        print("access granted")
        acc_trans(userid)
    else:
        input("Wrong credentials......try again?")
        return 0
# New Account Creation
#---------------------------------------------#
#---------------------------------------------#
#---------------------------------------------#
def signup():
    print("*---------------SIGN UP---------------*")
    first_name=input("Your first name:")
    sec_name=input("Your second name:")
    Addr_1=input("Enter address line 1")
    Addr_2=input("Enter address line 2")
    city=input("city")
    state=input("State")
    pincode=int(input("Pincode"))
    acctype=input("Savings(S) or Current(C)")
    cur.execute("INSERT INTO customers(cust_first_name, cust_second_name, Addr_line1, Addr_line2, city, state, Pincode, opening_date) VALUES(%s,%s,%s,%s,%s,%s,%s,CURRENT_TIMESTAMP())",(first_name,sec_name,Addr_1,Addr_2,city,state,pincode))
    cur.execute( "SELECT cust_id FROM customers WHERE customers.cust_first_name=%s AND customers.cust_second_name=%s",(first_name,sec_name))
    custID=cur.fetchall()
    print("Your Customer ID is ",custID[0][0])
    cur.execute("INSERT INTO `account`(`Acc_no`,`Acc_type`,`Acc_balance`,`locked|unlocked`,`Acc_status`,`deleted`) VALUES(%s,%s,0,1,1,0)",(str(custID[0][0]),acctype))
    print("Account created......")
    # Asking the new user to enter their Userid and password 
    while True:
        userid=input("Enter your new userid ")
        passwd=input("Enter your password ")
        if (userid or passwd) == '' or(userid or passwd) == '0' :
            print("enter valid user ID and password")
        else:
            cur.execute("INSERT INTO user_credentials(cust_id, userid, passwd, last_login, last_seen, last_transc) VALUES (%s,%s,%s,now(),CURRENT_TIMESTAMP(),now())",(str(custID[0][0]),userid,passwd))
            connection.commit()
            print("account registered....")
            signin()
start()
