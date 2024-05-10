<%@include file="layouts/header.jsp" %>  

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/newsevent.css">
<html>
    <head>
        <title>Event&News - Your Music Instrument Store</title>
        <style>
            .searchForm {
                position: relative;
            }
            .customSelect {
                width: 100%;
                max-width: 370px;
            }
            .searchForm.type2 input[type="search"] {
                background: #fff;
                border: 2px solid #959595;
            }

            .searchForm input[type="search"] {
                display: inline-block;
                width: 100%;
                max-width: 505px;
                height: 52px;
                padding: 11px 0 11px 20px;
                font-size: 17px;
                line-height: 19px;
                color: #222;
                font-style: normal;
                background-color: #f1f1f1;
                background-image: none;
                border: 1px solid #8196a1;
                border-radius: 0;
                -webkit-transition: none;
                transition: none;
            }
            .searchForm input[type="submit"] {
                background: transparent url(https://www.solodev.com/assets/news-events-tabs/search-ico.png) no-repeat center center;
                font-size: 0;
                color: transparent;
                border: 0;
                width: 52px;
                height: 52px;
                position: absolute;
                top: 0;
                right: 0;
            }
            .dropdownCategories {
                display: inline-block;
                width:100%;
                max-width: 505px;
                height: 52px;
                padding: 15px 0 11px;
                font-size: 17px;
                line-height: 19px;
                color: #222;
                font-style: normal;
                background: #fff;
                border: 2px solid #959595;
                background-image: none;
                border-radius: 0;
                -webkit-transition: none;
                transition: none;
            }
            .dropdownCategories select {
                width: 100%;
                padding: 0 20px;
                border: 0px;
                outline: none;
            }

            .nav-pills > li > a {
                border-radius: 0;
                font-size: 18px;
                padding: 6px 18px;
            }
            .nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
                color: #fff;
                background-color: #662d91;
            }

            .tab-content {
                margin: 50px 0 20px 0;
            }
            .media > .pull-left {
                margin-right: 29px;
            }
            .media .dateEl {
                display: inline-block;
                text-align: center;
                background: #f9f9f9;
                padding: 18px 0 25px 0;
                color: #173d51;
                font-size: 16px;
                font-weight: 700;
                width: 113px;
                text-transform: uppercase;
            }
            .media .dateEl em {
                display: block;
                color: #662d91;
                font-size: 42px;
                line-height: 1;
                margin-bottom: 5px;
                font-style: normal;
            }
            .media .media-heading a {
                color: #022235;
                font-size: 21px;
                text-transform: uppercase;
            }
            .media .meta-data {
                margin: 0 0 7px 0;
            }
            .media .longDate, .media .timeEl {
                display: inline-block;
                font-size: 14px;
                line-height: 14px;
                font-family: 'PT Sans Narrow', sans-serif;
                font-weight: 700;
                color: #636465;
                text-transform: uppercase;
                min-height: 16px;
            }
            .media .longDate {
                background: transparent url(../images/ico-calendar.png) no-repeat left top;
                padding: 0 10px 0 24px;
                border-right: 1px solid #eb5b4c;
                margin-right: 3px;
            }
            #tab1.tab-pane .media .longDate {
                border-right: none;
            }
            .blogPost--small {
                color: #7c7b7b;
                margin: 20px 30px 40px 0;
            }
            .blogPost--small .media > .pull-left {
                margin-right: 25px;
            }
            .blogPost--small a {
                color: #662d91;
            }
            .blogPost--small .date, .blogPost--small .dateEl2 {
                display: block;
                text-align: center;
                padding: 18px 0 25px 0;
                color: #fff;
                background: #662d91;
                width: 113px;
            }
            .blogPost--small .date span, .blogPost--small .dateEl2 span {
                display: inline-block;
                font-size: 42px;
                line-height: 1;
                letter-spacing: 0em;
                text-indent: -0.1em;
                color: #fff;
                font-weight: bold;
            }
            .blogPost--small .date small, .blogPost--small .dateEl2 small {
                display: block;
                font-size: 18px;
                text-transform: uppercase;
                color: #fff;
            }
            .blogPost--small h4 {
                margin: 0 0 12px 0;
                font-size: 22px;
                text-transform: uppercase;
            }



            .btn-default {
                color: #fff;
                font-size: 14px;
                background-color: #662d91;
                border-radius : 0px;
            }
        </style>
    </head>

    <div class="container">  

        <h3>EVENTS & NEWS</h3>


        <div class="row">
            <div class="col-lg-push-4 col-md-4 col-md-push-4">
                <div class="searchForm type2">
                    <form id="searchForm" class="searchForm">
                        <label class="sr-only" for="searchNewsEvents">Search News and Events</label>

                    </form>
                </div>
            </div>
            <div class="clearfix visible-sm visible-xs">
                &nbsp;
            </div>
            <div class="col-lg-push-4 col-md-4 col-md-push-4">

            </div>  
            <div class="clearfix visible-sm visible-xs">
                &nbsp;
            </div>
            <div class="col-lg-4 col-lg-pull-8 col-md-4 col-md-pull-8">
                <ul class="nav nav-pills" role="tablist">
                    <li class="active">
                        <a data-toggle="tab" href="#tab1" role="tab">Events</a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#tab2" role="tab">News</a>
                    </li>
                </ul>
            </div>
        </div><!-- / row -->
        <hr>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="tab1">
                <div class="row" id="eventList">
                    <div class="col-md-6">
                        <div class="media">
                            <a class="pull-left" href="#"><span class="dateEl"><em>30</em>Nov</span></a>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#">Drum Workshop</a>
                                </h4>
                                <div class="meta-data">
                                    <span class="longDate">Nov 30, 2024</span> <span class="timeEl">12:00pm - 02:00pm</span>
                                </div>
                                <p>
                                    Join us for a drumming workshop featuring the latest techniques.
                                </p>
                            </div><!-- / media-body -->
                        </div><!-- / media -->
                        <div class="media">
                            <a class="pull-left" href="#"><span class="dateEl"><em>11</em>Dec</span></a>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#">Piano Workshop</a>
                                </h4>
                                <div class="meta-data">
                                    <span class="longDate">Nov 31, 2024</span> <span class="timeEl">08:00am - 12:00pm</span>
                                </div>
                                <p>
                                    Attend our piano workshop and learn from experts.
                                </p>
                            </div><!-- / media-body -->
                        </div><!-- / media -->
                        <div class="media">
                            <a class="pull-left" href="#"><span class="dateEl"><em>15</em>Dec</span></a>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#">Violin Training</a>
                                </h4>
                                <div class="meta-data">
                                    <span class="longDate">Dec 1, 2024</span> <span class="timeEl">12:00pm - 04:00pm</span>
                                </div>
                                <p>
                                    Join our free violin training and playing session.
                                </p>
                            </div><!-- / media-body -->
                        </div><!-- / media -->
                    </div><!-- / .col-md-6 -->
                    <div class="col-md-6">
                        <div class="media">
                            <a class="pull-left" href="#"><span class="dateEl"><em>18</em>Dec</span></a>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#">Guitar Workshop</a>
                                </h4>
                                <div class="meta-data">
                                    <span class="longDate">Dec 3, 2024</span> <span class="timeEl">08:00am - 10:00am</span>
                                </div>
                                <p>
                                    Learn new guitar techniques in our workshop.
                                </p>
                            </div><!-- / media-body -->
                        </div><!-- / media -->
                        <div class="media">
                            <a class="pull-left" href="#"><span class="dateEl"><em>21</em>Dec</span></a>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#">Guitar Geek Out with Az Samad @ Gibson Guitar Avenue</a>
                                </h4>
                                <div class="meta-data">
                                    <span class="longDate">January 2024</span> <span class="timeEl">10:00am - 12:00pm</span>
                                </div>
                                <p>
                                    a guitarist, composer and educator based in Kuala Lumpur, Malaysia.
                                </p>
                            </div><!-- / media-body -->

                        </div><!-- / media -->
                    </div><!-- / .col-md-6 -->
                </div><!-- / row -->
                <div class="text-center">
                    <br>
                    <a class="btn btn-default" href="#">SEE ALL EVENTS</a>
                </div>
            </div>
            <div class="tab-pane fade" id="tab2">
                <div class="row" id="newsList">
                    <div class="col-md-6">
                        <div class="blogPost--small">
                            <div class="media">
                                <span class="pull-left"><a href="#"><span class="date"><span>29</span> <small>Nov</small></span></a></span>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="#">New Piano Model Released</a>
                                    </h4>
                                    <p>
                                        Learn about the latest piano model release and its features.
                                    </p>
                                </div>
                            </div>
                        </div><!-- / blogPost -->
                        <div class="blogPost--small">
                            <div class="media">
                                <span class="pull-left"><a href="#"><span class="date"><span>22</span> <small>Nov</small></span></a></span>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="#">New Guitar Model Released</a>
                                    </h4>
                                    <p>
                                        Check out the features of our newly released guitar model.
                                    </p>
                                </div>
                            </div>
                        </div><!-- / blogPost -->
                    </div><!-- / .col-md-6 -->
                    <div class="col-md-6">
                        <div class="blogPost--small">
                            <div class="media">
                                <span class="pull-left"><a href="#"><span class="date"><span>12</span> <small>Nov</small></span></a></span>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="#">This Mythbustin? Nashville YouTuber Is on a Guitar Gear Mission</a>
                                    </h4>
                                    <p>
                                        Why does your guitar sound that way? Is it your amp, your pickups, or your pedals? Jim Lill is trying to find out, one filmed A/B test at a time. 
                                    </p>
                                </div>
                            </div>
                        </div><!-- / blogPost -->
                        <div class="blogPost--small">
                            <div class="media">
                                <span class="pull-left"><a href="#"><span class="date"><span>10</span> <small>Nov</small></span></a></span>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        <a href="#">Review: Roland Juno-X</a>
                                    </h4>
                                    <p>
                                        This do-anything reissue of a classic 1980s synthesizer is perfect for studio or stage.
                                    </p>
                                </div>
                            </div>
                        </div><!-- / blogPost -->
                    </div><!-- / row -->
                    <div class="text-center">
                        <br>
                        <a class="btn btn-default" href="#">SEE ALL NEWS</a>
                    </div>
                </div>
            </div>
        </div>

    </div>              

</html>
<script>
    $(document).ready(function () {
        // Filter news and events based on search query and category selection
        $('#searchNewsEvents').on('input', function () {
            var query = $(this).val().toLowerCase();
            var category = $('#dropdownNewsEvents').val().toLowerCase();
            filterItems(query, category);
        });

        $('#dropdownNewsEvents').change(function () {
            var query = $('#searchNewsEvents').val().toLowerCase();
            var category = $(this).val().toLowerCase();
            filterItems(query, category);
        });

        function filterItems(query, category) {
            $('#eventList .media, #newsList .blogPost--small').each(function () {
                var itemName = $(this).find('.media-body h4.media-heading a').text().toLowerCase();
                var itemCategory = $(this).hasClass('media') ? 'event' : 'news';
                if ((itemName.indexOf(query) !== -1 || query === '') && (category === '' || itemName.indexOf(category) !== -1)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
    });

</script>
<%@include file="layouts/footer.jsp" %>  