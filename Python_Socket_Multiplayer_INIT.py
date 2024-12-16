def multiplayer(): # multiplayer option
################### Client_side
   if Client == True: # if client true
      player_name = input("Please type in your name.")
      online_host_address = input("Type in IP of HOST") # ask for ip
      online_host_port = input("Type in PORT of HOST") # ask for port
      if online_host_address:
        if online_host_port: # if successful
            send_message(My_IP +" | "+ datetime +" : "+"| 200: I have connected! Thanks for having me.") # connect
