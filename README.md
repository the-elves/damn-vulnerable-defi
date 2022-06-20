# My soulution to problem 3 of DVDeFi

The contract takes a function and calls $functionCall$ helper function. 

Also, I noticed the tokens used were specially casted to interface IERC20. This lead me to reading the documentation which lead to an idea of executing the approve function to approve our deployed contract to withdraw funds.
