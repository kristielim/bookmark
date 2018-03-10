#! /bin/bash
if [ -z "$1" ]
  then
    echo "No argument supplied"
    # add feature that prints out all possible arguments
    exit 1
fi
if [ $1 = hello ]
	then
	open ~/Documents/organize/hello.py
fi
if [ $1 = math ]
	then
	open /Users/kristielim/Documents/textbooks/Calculus3ERogawski.pdf
	open http://www.chegg.com/homework-help/Calculus-3rd-edition-chapter-15.6-problem-18E-solution-9781464125263
fi
if [ $1 = physics ]
	then
	open /Users/kristielim/Documents/textbooks/UniversityPhysicswithModernPhysics14thEdition.pdf 
	open https://www.chegg.com/homework-help/University-Physics-14th-edition-chapter-8-problem-7E-solution-9780133969290
fi

 echo hello world 
