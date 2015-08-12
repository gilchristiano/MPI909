package tasks

class Tarefas {

  	String nome
  	Date deadline
	static belongsTo = [categoria:Categoria]

	String toString(){
		this.categoria
	}

	static constraints = {
	nome nullable:false, blank:false, maxSize:156, unique:false
    categoria nullable: false
	}
}
