<addmenu>

  <div class="container">

    <h1 class="text-center heading">Add Your Cuisine Here!</h1>
    <div class="form-group">

      <input type="text" name="cuisinename" ref="cuisinename" placeholder="Cuisine Name" class="form-control"><br>
      <div class="form-group">
        <input type="text" name="foodName" ref="foodName" placeholder="Food Name" class="form-control"><br>
        <input type="text" name="foodphoto" ref="foodPhotosrc" placeholder="Food photoURL (optional)" class="form-control">
      </div>

      <span>Meal:</span>
      <select ref="mealtype" class="form-control">
        <option value="breakfast">breakfast</option>
        <option value="lunch">lunch</option>
        <option value="dinner">dinner</option>
        <option value="snacks">snacks</option>
      </select><br>

      <span>Element:</span>
      <select ref="element" class="form-control">
        <option value="a">Multivitamin-rich Foods</option>
        <option value="b">Omega-3 Foods</option>
        <option value="c">Minerals-rich foods (Calcium, Magnisium, etc.)</option>
        <option value="d">Protein-rich Foods</option>
        <option value="e">Antioxidants-rich Foods</option>
      </select><br>

      <textarea name="name" rows="5" cols="10" class="form-control" placeholder="Steps" ref="steps"></textarea>

      <div class="form-group" ref="taste">
        <label><input type="radio" name="taste" value="spicy">Spicy</label>
        <label><input type="radio" name="taste" value="sweet">Sweet</label>
        <label><input type="radio" name="taste" value="salty">Salty</label>
        <label><input type="radio" name="taste" value="plain">Plain</label>
      </div>

      <input type="text" name="photoURL" ref="cuiphotosrc" placeholder="Photo URL here" class="form-control"><br>
      <div class="text-center">
        <button class="submit" type="button" onclick={ submit }>
          Submit
        </button>
        <button class="cancel" type="button" onclick={ backToApp }>
          Haven't decided
        </button>
      </div>
    </div>

  </div>

  <script>
    console.log('addmenu page');
    var that = this;

    submit(e) {

      if (this.refs.cuisinename.value === "" || this.refs.foodName.value === "") { //why null could not work here?
        alert("Please add a cuisine name and a food name!");
        e.preventUpdate = true; // Prevents riot from auto update.
        return false; // Short-circuits function (function exits here, does not continue.
      }

      var cuisName = this.refs.cuisinename.value;
      var foodName = this.refs.foodName.value.toLowerCase();
      var foodSrc = this.refs.foodPhotosrc.value;
      var ele = this.refs.element.value;
      var steps = this.refs.steps.value;
      var cuisPhoSrc = this.refs.cuiphotosrc.value;
      var mealtype = this.refs.mealtype.value;

      // var taste = this.root.querySelector('[name="taste"]:checked').value;
      //
      // console.log(taste);

      var foodData = {
        element: ele,
        name: foodName,
        src: foodSrc
      };

      var foodPath = "foodsByElement/" + foodName;

      console.log(cuisPath);
      var cuiskey = database.ref(cuisPath).push().key;
      var cuisPath = "cuisineByFood/" + foodName + "/" + cuiskey;
      var cuisData = {
        food: foodName,
        meal: mealtype,
        name: cuisName,
        src: cuisPhoSrc,
        id: cuiskey,
        steps: steps
      };

      var updates = {};
      updates[foodPath] = foodData;
      updates[cuisPath] = cuisData;

      database.ref().update(updates);
      alert("Succeed!");

      //change mode:
      observable.trigger('tofoodpage');
    };

    backToApp(e) {
      observable.trigger('tofoodpage');
    }
  </script>
  <style>
    .heading {
      font-size: 6rem;
      font-family: Lobster,sens-serif;
      color: #ff8080;
    }
    button {
      font-size:2rem;
      color:#ff6666;
      background color:#ffe6e6;
      font-family:Montserrat,sans-serif;
    }
    button:hover {
      transition: 0.5s;
      background:#ff6666;
      color:#ffe6e6;
    }


    }
  </style>
</addmenu>
