###
# Ruby REPL game DSL
#  methods useful for any REPL-based game
###
def show_line
  puts "*" * 80
end

def intro
  show_line
  puts"
██╗    ██╗██╗   ██╗███╗   ██╗    ██████╗  ██████╗  ██████╗ ███╗   ███╗
██║    ██║╚██╗ ██╔╝████╗  ██║    ██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║
██║ █╗ ██║ ╚████╔╝ ██╔██╗ ██║    ██║  ██║██║   ██║██║   ██║██╔████╔██║
██║███╗██║  ╚██╔╝  ██║╚██╗██║    ██║  ██║██║   ██║██║   ██║██║╚██╔╝██║
╚███╔███╔╝   ██║   ██║ ╚████║    ██████╔╝╚██████╔╝╚██████╔╝██║ ╚═╝ ██║
 ╚══╝╚══╝    ╚═╝   ╚═╝  ╚═══╝    ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚═╝

"
  puts "It's 11 pm. You are working late at Wyncode alone. Suddenly you hear a loud
  commotion on the street of people yelling and sirens."
end

def get_input
  print ">> "
  gets.chomp.strip
end

def ask_question1(question)
  show_line
  puts question
  show_line
  puts "Do you choose option 1, 2, or 3?"
end

def ask_question2(question)
  show_line
  puts question
  show_line
  puts "Do you choose option 1 or 2?"
end

def ask_question(question, options)
  puts nil, question
  puts nil, "Options: #{options}"
end

def rejection_loop1
  puts "Unfortunately that is not an option. Your only hope for survival is to
  choose option 1, 2, or 3."
  puts "Do you choose option 1, 2, or 3?"
end

def rejection_loop2
  puts "Unfortunately that is not an option. Your only hope for survival is to
  choose option 1 or 2."
  puts "Do you choose option 1 or 2?"
end

def yes_or_no?
  choice = get_input
  case choice.capitalize
  when "Yes", 'Y', 'True', '1' # multiple option support in case/when
    true
  when "No", 'N', 'False', '0'
    false
  else
    # default yes
    true
  end
end

def startgame
  ask_question1("
  You have the following options:
  1- Look outside
  2- Ignore it- probably nothing serious
  3- Decide you don't want to take any chances- collect your things
  and get ready to leave
  ")
  continue = false
  until continue
    option_choice = get_input
    case option_choice
    when "1"
      continue = true
      puts look
    when "2"
      continue = true
      puts ignore
    when "3"
      continue = true
      puts collect
    else
      rejection_loop1
    end
  end
end

def look
  ask_question2("You see people running and screaming. They keep looking back with
  terrified expressions.

  You have the following options:
  1- Go outside to take a look
  2- Decide it's time to collect your things and get ready to leave")
  continue = false
  until continue
    option_choice = get_input
    case option_choice
    when "1"
      continue = true
      puts outside
    when "2"
      continue = true
      puts collect
    else
      rejection_loop2
    end
  end
end

def outside
  ask_question2("You see a horde of mutants running towards you.
  You've seen tons of zombie movies, but you were never prepared for mutants. They
  are destroying everything in their path!

1             +MMMMMMNMMMMM
1          =MMMMMMMMMMMMMMMMMM
1          MMMMM███ ███MMMMMMM
1          MMMMMMMMMMMMMMMMMMM
1      MMMM███╔███MMMM███╔███MMMM
1    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMI
1     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
1   ZMMMMM8IMMMMMMMMMMMMMMMMDZMMMMMM7
1  =MMMMZ    =MMMMMMMMMMMMMM?    =MMMM.
1   MMMM       DMMMMMMMMMMMMM?.     OMMM:
1   MMM        MMMMMMMMMMMMMMMM      $MM=
1  MMM=     ZMMMMMMMMMMMMMMMMMI     ?MM+
1 =MMMMM?  ?MMMMMMMMMMMMMMMMMMMM$ ,MMMMZ
1 7MM.ZM D$MMMMMMMMMMMMMMMMMMMMM7ZM. M7
1          MMMMMMMMMMMMMMMMMMMMMM,
1        .MMMMMMMMMMDD.  7MMMMMN.
1        =MMMMM+          MMMMMN,
1          +MMMMMMM=    =MMMMMM~
1          . ZMMMMMM7. ,MMMMMMMM:
1         MMMMMMMMMMO  7MMMMMMMI,
1      :MMMMMMMMND$: .$MMMMMM=
1      ~Z$?~  .        +MMMMMM
1                         .?8D8$~

  You have the following options:
  1- Try to escape by running away from the mutants
  2- Decide you aren't going down without a fight and face the mutants head on")
  continue = false
  until continue
    option_choice = get_input
    case option_choice
    when "1"
      continue = true
      puts endrun
    when "2"
      continue = true
      puts endfight
    else
      rejection_loop2
    end
  end
end

def collect
  ask_question2("You collect your things. Suddenly you hear a noise. Something is
  beating down the front door. You see it's a bunch of killer mutants. Better get
  out of here quick!

  1             +MMMMMMNMMMMM
  1          =MMMMMMMMMMMMMMMMMM
  1          MMMMM███ ███MMMMMMM
  1          MMMMMMMMMMMMMMMMMMM
  1      MMMM███╔███MMMM███╔███MMMM
  1    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMI
  1     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  1   ZMMMMM8IMMMMMMMMMMMMMMMMDZMMMMMM7
  1  =MMMMZ    =MMMMMMMMMMMMMM?    =MMMM.
  1   MMMM       DMMMMMMMMMMMMM?.     OMMM:
  1   MMM        MMMMMMMMMMMMMMMM      $MM=
  1  MMM=     ZMMMMMMMMMMMMMMMMMI     ?MM+
  1 =MMMMM?  ?MMMMMMMMMMMMMMMMMMMM$ ,MMMMZ
  1 7MM.ZM D$MMMMMMMMMMMMMMMMMMMMM7ZM. M7
  1          MMMMMMMMMMMMMMMMMMMMMM,
  1        .MMMMMMMMMMDD.  7MMMMMN.
  1        =MMMMM+          MMMMMN,
  1          +MMMMMMM=    =MMMMMM~
  1          . ZMMMMMM7. ,MMMMMMMM:
  1         MMMMMMMMMMO  7MMMMMMMI,
  1      :MMMMMMMMND$: .$MMMMMM=
  1      ~Z$?~  .        +MMMMMM
  1                         .?8D8$~

  You have the following options:
  1- Decide to hide at Wyncode
  2- Head out the back door")
  continue = false
  until continue
    option_choice = get_input
    case option_choice
    when "1"
      continue = true
      puts endhide
    when "2"
      continue = true
      puts endback
    else
      rejection_loop2
    end
  end
end

def ignore
  ask_question2("You turn your attention back to your work. Suddenly, a man comes
  crashing through the window.

  Your have the following options:
  1- Run over to the guy and find out what is happening
  2- Decide it's time to collect your things and get ready to leave")
  continue = false
  until continue
    option_choice = get_input
    case option_choice
    when "1"
      continue = true
      puts help
    when "2"
      continue = true
      puts collect
    else
      rejection_loop2
    end
  end
end

def help
  ask_question2("The guy looks terrified and says 'There are mutants attacking
  the city- they are destroying everything! Run!'

  You have the following options:
  1- Try to escape out on the street
  2- Decide you're not going down without a fight!")
  continue = false
  until continue
    option_choice = get_input
    case option_choice
    when "1"
      continue = true
      puts endrun
    when "2"
      continue = true
      puts endfight
    else
      rejection_loop2
    end
  end
end


def endback
  puts "You quickly run out the back door. Suddenly you see a horde of mutants.
  They surround you and kill you before you have a chance to make any more
  decisions. Tough break!

  1             +MMMMMMNMMMMM
  1          =MMMMMMMMMMMMMMMMMM
  1          MMMMM███ ███MMMMMMM
  1          MMMMMMMMMMMMMMMMMMM
  1      MMMM███╔███MMMM███╔███MMMM
  1    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMI
  1     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  1   ZMMMMM8IMMMMMMMMMMMMMMMMDZMMMMMM7
  1  =MMMMZ    =MMMMMMMMMMMMMM?    =MMMM.
  1   MMMM       DMMMMMMMMMMMMM?.     OMMM:
  1   MMM        MMMMMMMMMMMMMMMM      $MM=
  1  MMM=     ZMMMMMMMMMMMMMMMMMI     ?MM+
  1 =MMMMM?  ?MMMMMMMMMMMMMMMMMMMM$ ,MMMMZ
  1 7MM.ZM D$MMMMMMMMMMMMMMMMMMMMM7ZM. M7
  1          MMMMMMMMMMMMMMMMMMMMMM,
  1        .MMMMMMMMMMDD.  7MMMMMN.
  1        =MMMMM+          MMMMMN,
  1          +MMMMMMM=    =MMMMMM~
  1          . ZMMMMMM7. ,MMMMMMMM:
  1         MMMMMMMMMMO  7MMMMMMMI,
  1      :MMMMMMMMND$: .$MMMMMM=
  1      ~Z$?~  .        +MMMMMM
  1                         .?8D8$~


  ---------------------------------GAME OVER-----------------------------------"


end


def endrun
  puts "You see a horde of mutants running towards you. They are destroying
  everything and killing people. You try to run but you trip. The mutants kill
  you immediately. Wow bad luck!

  1             +MMMMMMNMMMMM
  1          =MMMMMMMMMMMMMMMMMM
  1          MMMMM███ ███MMMMMMM
  1          MMMMMMMMMMMMMMMMMMM
  1      MMMM███╔███MMMM███╔███MMMM
  1    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMI
  1     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  1   ZMMMMM8IMMMMMMMMMMMMMMMMDZMMMMMM7
  1  =MMMMZ    =MMMMMMMMMMMMMM?    =MMMM.
  1   MMMM       DMMMMMMMMMMMMM?.     OMMM:
  1   MMM        MMMMMMMMMMMMMMMM      $MM=
  1  MMM=     ZMMMMMMMMMMMMMMMMMI     ?MM+
  1 =MMMMM?  ?MMMMMMMMMMMMMMMMMMMM$ ,MMMMZ
  1 7MM.ZM D$MMMMMMMMMMMMMMMMMMMMM7ZM. M7
  1          MMMMMMMMMMMMMMMMMMMMMM,
  1        .MMMMMMMMMMDD.  7MMMMMN.
  1        =MMMMM+          MMMMMN,
  1          +MMMMMMM=    =MMMMMM~
  1          . ZMMMMMM7. ,MMMMMMMM:
  1         MMMMMMMMMMO  7MMMMMMMI,
  1      :MMMMMMMMND$: .$MMMMMM=
  1      ~Z$?~  .        +MMMMMM
  1                         .?8D8$~

  ---------------------------------GAME OVER-----------------------------------"

end


def endfight
  puts "You decide you aren't going down without a fight. You run towards
  the horde screaming 'Die!!' while pelting Dark Dogs. You have no effect
  on the mutants... but luckily their leader likes your spirit and
  decides to spare your life and take you into the mutant gang.
  Enjoy your new mutant life!

  1             +MMMMMMNMMMMM
  1          =MMMMMMMMMMMMMMMMMM
  1          MMMMM███ ███MMMMMMM
  1          MMMMMMMMMMMMMMMMMMM
  1      MMMM███╔███MMMM███╔███MMMM
  1    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMI
  1     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  1   ZMMMMM8IMMMMMMMMMMMMMMMMDZMMMMMM7
  1  =MMMMZ    =MMMMMMMMMMMMMM?    =MMMM.
  1   MMMM       DMMMMMMMMMMMMM?.     OMMM:
  1   MMM        MMMMMMMMMMMMMMMM      $MM=
  1  MMM=     ZMMMMMMMMMMMMMMMMMI     ?MM+
  1 =MMMMM?  ?MMMMMMMMMMMMMMMMMMMM$ ,MMMMZ
  1 7MM.ZM D$MMMMMMMMMMMMMMMMMMMMM7ZM. M7
  1          MMMMMMMMMMMMMMMMMMMMMM,
  1        .MMMMMMMMMMDD.  7MMMMMN.
  1        =MMMMM+          MMMMMN,
  1          +MMMMMMM=    =MMMMMM~
  1          . ZMMMMMM7. ,MMMMMMMM:
  1         MMMMMMMMMMO  7MMMMMMMI,
  1      :MMMMMMMMND$: .$MMMMMM=
  1      ~Z$?~  .        +MMMMMM
  1                         .?8D8$~


  ---------------------------------GAME OVER-----------------------------------"

end

def endhide
  puts "You run into the kitchen, lock the door, and turn out the lights. You hear
  the mutants enter Wyncode. They destroy everything, and move on, but don't
  break into the kitchen. You have survived! You must now rebuild humanity
  from Wyncode headquarters as the new leader of the human race!

  ██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗██╗███╗   ██╗██╗
  ╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██║████╗  ██║██║
   ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║██╔██╗ ██║██║
    ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║██║╚██╗██║╚═╝
     ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝██║██║ ╚████║██╗
     ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═╝


                                                         BUILD
                                                         BUILD     BUIL
             BU     BUI        BUI                       BUILD     BUIL
             BUI    BUILDI     BUI              BUILD BUILDINGBU   BUIL
             BUI  BUILDING     BUI              BUILD BUILDINGBU   BUIL
             BUI  BUILDING     BUI     BUILDI   BUILD BUILDINGBU   BUIL
        BU   BUI BUILDINGB     BUI     BUILDI   BUILD BUILDINGBUILDINGB
 BUILDINGB   BUI BUILDINGB  BUILDINGB  BUILDI   BUILD BUILDINGBUILDINGB
 BUILDINGB   BUILDINGBUILD  BUILDINGB  BUILDI   BUILDINGBUILDINGBUILDIN
BUILDINGBU   BUILDINGBUILDINGBUILDING  BUILDINGBUILDINGBUILDINGBUILDING
BUILDINGBU   BUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBU
BUILDINGBU   BUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBU
BUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDIN
BUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDIN
BUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGB dp BU
BUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDINGBUILDIN



  ---------------------------------GAME OVER-----------------------------------"

end
#********************************************
def continue?
  ask_question("Play again?", "Yes, No")
  result = yes_or_no?
  # command line code to speak words
  puts `say Goodbye!` unless result
  result
end


def start_game_loop
  game_over = false
  until game_over
    intro
    startgame
    game_over = !continue?
  end
end

start_game_loop
