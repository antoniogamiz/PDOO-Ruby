class Padre #la definicion de esta clase no da problemas
  @atributo1=1 #LOS ATRIBUTOS DE INSTANCIA DE LA CLASE NO SE HEREDAN, SI LLAMAMOS A self.salida dara error
  @@atributo2=2
  
  def initialize
    @atributo1=11 
  end
  
  def self.salida
    puts @atributo1+1
    puts @@atributo2+1
  end
  
  def salida
    puts @atributo1+1
    puts @@atributo2+1
  end
  
  private
  def privado
    puts "Soy un metodo privado"
  end
  
end

class Hija < Padre
  @@atributo2=22 #ATRIBUTO2 SE REDIFINE. SOLO HAY UN ATRIBUTO DE CLASE PARA TODAS LAS CLASES DE LA HERENCIA (INCLUIDA EL PADRE)
  
  protected
  def protegido
    puts "Soy un metodo protegido"
  end
end

class Nieta < Hija
  @atributo1=111
  def metodoNieto(n)
    privado #Funciona
    protegido #Funciona
    self.privado #privado y receptor explicito
    self.protegido #estoy dentro de una subclase de la clase que declara el protegido por lo que sirve
    n.privado #privado y receptor
    n.protegido # funciona
  end
  
  
end

Padre.new.salida #bien
Padre.salida #bien
puts "===="
Hija.new.salida #bin
Hija.salida #MAL, @atributo1 de instancia de la clase no esta definido
puts "===="
Nieta.new.salida
Nieta.salida
Nieta.new.metodoNieto(Nieta.new)

#OUTPUT
#salida del padre
#
#
#12
#23
#ERROR
#23

#12
#23
#112
#23



