<app>
  <p>
    <i class="fa fa-bars" style="font-size:36px" onclick={ openItem }></i>
  </p>

  <div class="title">
    <h1>Be Impeccable About Your Language</h1>
    <h2>A Nice-Words-Only Digital Journal</h2>
  </div>

  <div class="btn">
    <button type="button" name="button" onclick={ toggleEditor }>Start Journaling</button>
  </div>


  <div if={ startJournal} class="list">
    <item each={ journalList }></item>
  </div>



  <text-editor if={ creatingJournal }></text-editor>



  <script>

    var that = this;
    this.creatingJournal = false;
    this.startJournal = false;
    this.journalList = [];

    var journalRef = database.ref('journals');
    journalRef.on('value', function(snap) {
      var data = snap.val();
      that.journalList = Object.values(data);
      that.update();
    });

    this.toggleEditor = function(event){
      this.creatingJournal = true;
    };

    this.closeEditor = function(event){
      that.creatingJournal = false;
      that.update();
    };

    this.openItem = function(event){
      this.startJournal = !this.startJournal;

    }





  </script>


  <style>
    :scope {

      display: block;
      border: 1px solid orange;
      padding: 10px;
      position: relative;
      height: auto;
      width: auto;
    }
    .list {
      margin-top: 15px;
    }
    button{
    background-color: #4CAF50; /* Green */
    border: none;
    font-family: 'Raleway', sans-serif;
    color: white;
    padding: 16px 32px;
    text-align: center;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    background-color: #dae0da;
    color: black;
    border: 2px solid #4CAF50;
    }
    button:hover {
      background-color: #4CAF50;
      color: white;
      opacity: 1

    }
    .title{
      margin-left: auto;
      margin-right: auto;
      margin-top: 25em;
      width: 50%;


    }
    .btn{
      margin-left: auto;
      margin-right: auto;
      margin-top: 5em;
      width: 30%;

    }
  </style>

</app>
