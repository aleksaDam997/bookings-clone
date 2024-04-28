{{template "admin" .}}

{{define "css"}}
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
{{end}}

{{define "page-title"}}
    All Reservations
{{end}}

{{define "content"}}
    <div class="col-md-12">
        {{$res := index .Data "reservations"}}

        <table class="table table-striped table-hower" id="all-res">

            <thead>
                <tr>
                    <th>ID</th>
                    <th>Last Name</th>
                    <th>Room</th>
                    <th>Arrival</th>
                    <th>Departure</th>
                </tr>
            </thead>
            <tbody>
            {{range $res}}
                <tr>
                    <td>{{.ID}}</td>
                    <td>
                        <a href="/admin/reservations/all/{{.ID}}/show">{{.LastName}}</a>
                    </td>
                    <td>{{.Room.RoomName}}</td>
                    <td>{{humanDate .StartDate}}</td>
                    <td>{{.EndDate}}</td>
                </tr>
            {{end}}
            </tbody>
        </table>
    </div>
{{end}}

{{define "js"}}
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const dataTable = new simpleDatatables.DataTable("#all-res", {
                select: 3,
                sort: "desc"
            })
        })
        
    </script>
{{end}}