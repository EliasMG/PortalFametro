package br.edu.fametro.portal.model.enums;

public enum Curso {
	SI("Sistemas de Informa��o", "SINF"), ADS("An�lise e Desenvolvimento de Sistemas", "ADSIS");

	private final String nome;
	private final String codigo;

	private Curso(String nome, String codigo) {
		this.nome = nome;
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public String getCodigo() {
		return codigo;
	}
}
