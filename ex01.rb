# Stefano say hi to pirates!

class Stringed
    @what = "[silence]"
    @name = ""
    @hasStrings=true
    @numberOfStrings=0
    
    #metodo di classe
    def self.hasStrings?
      return @hasStrings?"si":"no"
    end
    
    #metodo di istanza
    def numberOfStrings
      return @numberOfStrings.to_s
    end
    
    #risuona come ogni strumento fa
    def resonate 
      yield
    end
    
    #torna il nome 
    def getName
      return @name
    end
        
    #salva la nota in esecuzione
    def setWhat (what)
      @what = what
    end
    
    #torna la nota in esecuzione
    def getWhat
      @what
    end
end  

class Guitar < Stringed 
    
    @how = "[mute]"
    @numberOfBronzeStrings=0
    @type = "Stringed"
    
    #torna il tipo 
    def self.getType
      return @type
    end
    
    def initialize (name,nos, nobs)
      @numberOfStrings=nos
      @name="Chitarra " + name
      @numberOfBronzeStrings=nobs
    end
    
    #fa suonare lo strumento
    def sound
      puts "Mode: "+@how;
      resonate
    end
    
    #fa suonare lo strumento aggiungendo delle informazioni in più
    def resonate
      super { puts "What: "+@what;}
    end
    
    #salva la modalità
    def setHow (how)
      @how=how
    end

    #torna la modalità
    def getHow
      @how
    end
    
    def hasBronzeStrings?
      return @numberOfBronzeStrings>0?true:false
    end
    
    def numberOfBronzeStrings
      return @numberOfBronzeStrings.to_s
    end
end  


  #torna la modalità di esecuzione  
  mode = lambda { |how| return how } 

  #torna la nota
  note = Proc.new do |note| 
    note
  end 



Electric= Guitar.new("Elettrica",6,3);
puts "Suono una: " + Electric.getName + ", uno strumento di tipo " + Guitar.getType
Electric.setWhat(note.("D"))
Electric.setHow(mode.call("pick"))
Electric.sound
puts "\r\nCorde: "+Electric.numberOfStrings
if Electric.hasBronzeStrings? then
  puts "di cui bronzate: "+Electric.numberOfBronzeStrings
end

puts "\r\n"

Acoustic= Guitar.new("Acustica",6, 4);
puts "Suono una: " + Acoustic.getName + ", uno strumento di tipo " + Guitar.getType
Acoustic.setWhat(note.("C"))
Acoustic.setHow(mode.call("arp"))
Acoustic.sound

puts "\r\nCorde: "+Acoustic.numberOfStrings
if Acoustic.hasBronzeStrings? then
  puts "di cui bronzate: "+Acoustic.numberOfBronzeStrings
end

#perchè non funziona?
puts "\r\nLe chitarre hanno corde?" 
puts Guitar.hasStrings?

puts "\r\nGli strumenti a corde hanno corde?" 
puts Stringed.hasStrings?

#following should not work! :-P //instance method
#puts "\r\nQuante corde hanno gli strumenti a corde?" 
#puts Stringed.numberOfStrings