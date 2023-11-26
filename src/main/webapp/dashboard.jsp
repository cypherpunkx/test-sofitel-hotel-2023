<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.student.model.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("data") == null) {
		response.sendRedirect("login.jsp");
	}

	List<Person> people = new ArrayList<>();
	people.add(new Person("s1", "rafly", "Dep 1", 35, 0));
	people.add(new Person("s2", "erik", "Dep 1", 70, 0));
	people.add(new Person("s3", "dadang", "Dep 1", 60, 0));
	people.add(new Person("s4", "mikael", "Dep 1", 90, 0));
	people.add(new Person("s5", "zendaya", "Dep 2", 30, 0));
	people.add(new Person("s6", "lulu", "Dep 3", 32, 0));
	people.add(new Person("s7", "eki", "Dep 3", 70, 0));
	people.add(new Person("s8", "deni", "Dep 3", 20, 0));

	Map<String, List<Person>> groupedMap = new HashMap<>();
	Map<String, Double> averagePassPercentageMap = new HashMap<>();

	// Group rows by Department
	for (Person person : people) {
		if (!groupedMap.containsKey(person.getDepartment())) {
			groupedMap.put(person.getDepartment(), new ArrayList<>());
		}
		groupedMap.get(person.getDepartment()).add(person);
	}

	// Calculate and set Pass Percentage based on Mark
	for (Map.Entry<String, List<Person>> entry : groupedMap.entrySet()) {
		List<Person> departmentRows = entry.getValue();
		int totalPass = 0;
		for (Person person : departmentRows) {
			if (person.getMark() >= 40) {
		totalPass++;
			}
		}
		double passPercentage = (departmentRows.size() > 0) ? (double) totalPass / departmentRows.size() * 100 : 0;

		// Set Pass Percentage for each row in the department
		for (Person person : departmentRows) {
			person.setPassPercentage(passPercentage);
		}
	}
	%>

	<main class="container">
		<div
			class="d-flex justify-content-center align-items-center flex-column min-vh-100">
			<div class="pb-4">
				<h1>
					Welcome <span id="userID" class="text-info">${data}</span>
				</h1>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Department</th>
						<th scope="col">Student ID</th>
						<th scope="col">Marks</th>
						<th scope="col">Pass %</th>

					</tr>
				</thead>
				<tbody class="align-middle">
					<%
					int lastIndex = -1; // Menyimpan indeks baris terakhir dari setiap departemen
					for (Map.Entry<String, List<Person>> entry : groupedMap.entrySet()) {
						for (Person person : entry.getValue()) {
							if (entry.getValue().indexOf(person) == 0) {
						lastIndex = entry.getValue().indexOf(person);
					%>
					<tr>
						<td rowspan="<%=entry.getValue().size()%>"><%=person.getDepartment()%></td>
						<td class="person" data-person-id="<%=person.getName()%>"><%=person.getId()%></td>
						<td><%=person.getMark()%></td>
						<td rowspan="<%=entry.getValue().size()%>"><%=person.getPassPercentage()%></td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<td class="person" data-person-id="<%=person.getName()%>"><%=person.getId()%></td>
						<td><%=person.getMark()%></td>
					</tr>
					<%
					}
					}
					}
					%>
				</tbody>
			</table>


			<form action="logout" method="post">
				<button type="submit" class="btn btn-warning">Logout</button>
			</form>
		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".person").on("click", function() {
				// Mengambil data-person-id dari atribut data
				var personId = $(this).data("person-id");
				// Menampilkan informasi di konsol browser atau melakukan tindakan lainnya
				alert(personId)
				console.log('Clicked Person ID:', personId);
			});
		})
	</script>
</body>
</html>
