<%@ page import="tasks.Tarefas" %>



<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="tarefas.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="128" required="" value="${tarefasInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="tarefas.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${tasks.Categoria.list()}" optionKey="id" required="" value="${tarefasInstance?.categoria?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tarefasInstance, field: 'deadline', 'error')} required">
	<label for="deadline">
		<g:message code="tarefas.deadline.label" default="Deadline" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deadline" precision="day"  value="${tarefasInstance?.deadline}"  />

</div>

