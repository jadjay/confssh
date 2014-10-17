#!/usr/bin/env ruby

args=ARGV
$debug="on"
$errors = {
  badarg: [ 1, "bad argument" ],
  other: [ 2, "" ],
}

$commands = {
  create: "",
  list: "",
  remove: "",
  modify: "",
}

def usage()
  puts "confssd [command] [ ssh commandline | hostname ]

  commands among : create, list, delete, modify
  "
end

def exiting( error, switch=$debug )
  if switch == "on"
    print "error: %s\n" % $errors[error][1]
  end
  exit $errors[error][0]
end

def create( chaine )
  print "%s : %s\n" %  ['create',chaine]
end

def list( chaine )
  print "%s : %s\n" %  ['list',chaine]
end

def remove( chaine )
  print "%s : %s\n" %  ['remove',chaine]
end

def modify( chaine )
  print "%s : %s\n" %  ['modify',chaine]
end


if args[0].nil? or not $commands.member? args[0].to_s.to_sym 
  usage()
  exiting(:badarg)
end

commande = args[0]
arguments = args[1..-1].join(' ')
send(commande,arguments)

# vim: ai ts=2 sts=2 et sw=2 ft=ruby
