
<%@ page import="tasks.Tarefas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tarefas.label', default: 'Tarefas')}" />
		<title><g:message code="default.list.label" args="[entityName]" />Tasks-03</title>
	</head>
	<body>
		<a href="#list-tarefas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<!- Seção "importada" da view Criar Tarefas (create.gsp - Groovy Server Page) ->
		<div id="create-tarefas" class="content scaffold-create" role="main" align="left">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${tarefasInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${tarefasInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
				<g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:tarefasInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		<!-- fim da seção create.gsp -->
		<div id="list-tarefas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nome" title="${message(code: 'tarefas.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="deadline" title="${message(code: 'tarefas.deadline.label', default: 'Deadline')}" />

						<th><g:message code="tarefas.categoria.label" default="Categoria" /></th>

						<th><g:message  default="Ações" />Ações</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tarefasInstanceList}" status="i" var="tarefasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tarefasInstance.id}">${fieldValue(bean: tarefasInstance, field: "nome")}</g:link></td>
					
						<td><g:formatDate date="${tarefasInstance.deadline}" /></td>

						<td>${fieldValue(bean: tarefasInstance, field: "categoria")}</td>
						<td><g:form url="[resource:tarefasInstance, action:'delete']" method="DELETE">
							<fieldset class="buttons">
								<g:link class="edit" action="edit" resource="${tarefasInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
								<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</fieldset>
						</g:form>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:if test="${tarefasInstanceCount}">
				<g:paginate total="${tarefasInstanceCount ?: 0}" />
					Você tem ${tarefasInstanceCount} tarefa(s)
				</g:if>
			</div>
		</div>
	</body>
</html>
