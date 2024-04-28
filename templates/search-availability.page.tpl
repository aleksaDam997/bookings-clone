{{template "base" .}}

{{define "content"}}
    <div class="container">

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <h1 class="mt-5">Search for Availability</h1>


                <form action="/search-availability" method="post" novalidate class="needs-validation">
                    <input type="hidden" name="csrf_token" value="{{.CSRFToken}}">
                    <div class="form-row">
                        <div class="col">
                            <div class="form-row" id="reservation-dates">
                                <div class="col">
                                    <input required class="form-control" type="text" name="start_date" id="start_date" placeholder="Arrival">
                                </div>
                                <div class="col">
                                    <input required class="form-control" type="text" name="end_date" id="end_date" placeholder="Departure">
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr>

                    <button type="submit" class="btn btn-primary">Search Availability</button>

                </form>

            </div>
        </div>

    </div>
{{end}}

{{define "js" }}

    <script>
        const elem = document.getElementById('reservation-dates');
        const rangePicker = new DateRangePicker(elem, {
            format: "yyyy-mm-dd",
            minDate: new Date(),
        });
    </script>
{{end}}