{{template "base" .}}

{{define "content"}}
    <div class="container">

        <div class="row">
            <div class="col">
                <img src="/static/images/marjors-suite.png" class="img-fluid img-thumbnail mx-auto d-block room-image" alt="room image">
            </div>
        </div>


        <div class="row">
            <div class="col">
                <h1 class="text-center mt-4">Major's Suite</h1>
                <p>
                    Your home away form home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
                    Your home away form home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
                    Your home away form home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
                    Your home away form home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
                    Your home away form home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
                    Your home away form home, set on the majestic waters of the Atlantic Ocean, this will be a vacation to remember.
                </p>
            </div>
        </div>


        <div class="row">

            <div class="col text-center">

                <a id="check-availability-button" href="#!" class="btn btn-success">Check Availability</a>

            </div>
        </div>


    </div>
{{end}}


{{define "js"}}
<script>
    document.getElementById("check-availability-button").addEventListener("click", function () {
        let html = `
            <form id="check-availability-form" action="" method="post" novalidate class="needs-validation">
                <div class="form-row">
                    <div class="col">
                        <div class="form-row" id="reservation-dates-modal">
                            <div class="col">
                                <input disabled required class="form-control" type="text" name="start_date" id="start_date" placeholder="Arrival">
                            </div>
                            <div class="col">
                                <input disabled required class="form-control" type="text" name="end_date" id="end_date" placeholder="Departure">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            `
        attention.custom({
            msg: html,
            title: "Choose your dates",

            willOpen: () => {
                const elem = document.getElementById('reservation-dates-modal');
                const rp = new DateRangePicker(elem, {
                    format: 'yyyy-mm-dd',
                    showOnFocus: true,
                    minDate: new Date(),
                })
            },

            didOpen: () => {
                document.getElementById('start_date').removeAttribute('disabled');
                document.getElementById('end_date').removeAttribute('disabled');

            },

            callback: function (result) {
                console.log("called");

                let form = document.getElementById("check-availability-form");
                let formData = new FormData(form);
                formData.append("csrf_token", "{{.CSRFToken}}");
                formData.append("room_id", "2");

                fetch('/search-availability-json', {
                    method: "post",
                    body: formData,
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.ok) {
                            attention.custom({
                                icon: 'success',
                                showConfirmButton: false,
                                msg: '<p>Room is available!</p>'
                                    + '<p><a href="/book-room?id='
                                    + data.room_id
                                    + '&s='
                                    + data.start_date
                                    + '&e='
                                    + data.end_date
                                    + '" class="btn btn-primary">'
                                    + 'Book now!</a></p>',
                            })
                        } else {
                            attention.error({
                                msg: "No availability",
                            })
                        }
                    })
            }
        });
    })
</script>
{{end}}