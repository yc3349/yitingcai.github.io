<foodpage>
  <!-- firstpage -->
  <div class="joumbotron">
    <div class="container">
      <h1 class="text-center heading">
        Nutritions for Depressed Kids</h1>
      <p class="text-center intro">We help parents to create and collect special recipes to take care of depressed kids with special
        <span>love</span></p>
    </div>
  </div>
  <div class="row">
    <h2 class="text-center sub">
      Multivitamin-rich Foods</h2>
    <fooditem class="col-xs-4" each={ food in foodByElementa }></fooditem>
  </div>
  <div class="row">
    <h2 class="text-center sub">
      Omega-3 Foods</h2>
    <fooditem class="col-xs-4" each={ food in foodByElementb }></fooditem>
  </div>
  <div class="row">
    <h2 class="text-center sub">Minerals-rich foods (Calcium, Magnisium, etc.)</h2>
    <fooditem class="col-xs-4" each={ food in foodByElementc }></fooditem>
  </div>
  <div class="row">
    <h2 class="text-center sub">
      Protein-rich Foods</h2>
    <fooditem class="col-xs-4" each={ food in foodByElementd }></fooditem>
  </div>
  <div class="row">
    <h2 class="text-center sub">
      Antioxidants-rich Foods</h2>
    <fooditem class="col-xs-4" each={ food in foodByElemente }></fooditem>
  </div>

  <script>
    console.log('foodpage', this);

    var tag = this;
    this.allFood = [];
    this.foodByElementa = [];
    this.foodByElementb = [];
    this.foodByElementc = [];
    this.foodByElementd = [];
    this.foodByElemente = [];

    this.typeName = [];

    var foodsByElemetRef = database.ref('/foodsByElement');

    foodsByElemetRef.on('value', function (snap) {
      var data = snap.val();

      tag.allFood = [];
      for (food in data) {
        tag.allFood.push(data[food]);
      };

      tag.update();
      //element a:
      tag.foodByElementa = getFoodByElement('a');
      ///element b:
      tag.foodByElementb = getFoodByElement('b');
      ///element c:
      tag.foodByElementc = getFoodByElement('c');
      ///element d:
      tag.foodByElementd = getFoodByElement('d');
      ///element b:
      tag.foodByElemente = getFoodByElement('e');

      console.log('allFood', tag.allFood);

      tag.update();
    });

    function getFoodByElement(element) {
      return tag.allFood.filter(function (food) {
        return food.element == element;
      });
    }
  </script>

  <style>
    .item {
      border: 2px solid blue;
      margin: 10px;
      padding: 5px;

    }
    .joumbotron {
      background: url("https://www.logan.edu/mm/images/Nutrition/MSN-Main.jpg") no-repeat center center;
      background-size: cover;
      height: 62rem;
      padding:0;
      margin:0;
    }
    .heading {
      margin-top: 20rem;
      margin-bottom: 7rem;
      font-family: Lobster,sans-serif;
      color:white;
      font-size:8rem;

    }
    .intro {
      margin-bottom: 30rem;
      font-family: Montserrat,sans-serif;
      color:white;
      font-size:2rem;
    }
    span {
      font-family: "Lobster",sans-serif;
      color: #ff6666;
      font-size:3rem;
    }
    .sub {
      font-family: "Lobster",sans-serif;
      font-size:4rem;
      background-color:#ffa366;
    }
  </style>

</foodpage>
