package tasks

class Categoria {
	String nome

	String toString() {
		this.nome
	}
    static constraints = {
    	nome nullable:false, blank:false, maxSize:16, unique:true
    }
}
