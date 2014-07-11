--
-- entity data
--

return {

  --
  -- level
  -- 

  platforms = {

    { x = 0,  y = 200, rotation = 5 },
    { x = 200, y = 400, rotation = -5 },
    { x = 0,  y = 560, rotation = 5 },
    { x = 200, y = 790, rotation = -5 }

  },

  player = {

    ["bear"] = {

      animation = {
        sheet = "images/sheets/bear.png",
        size  = { 147, 120 },
        frames = 2,
        time = 500
      },
    },
  },

  --
  -- animals
  --

  animalNames = { "mouse", "hedgehog", "squirrel", "rabbit" },

  animals = {

    ["squirrel"] = {

      animation = {
        sheet = "images/sheets/squirrel.png",
        size  = { 84, 63 },
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      behavior = {
        eat = { },
        jump = { },
        die = { "acorn", "berry", "pinecone", "beehive"}
      },

      properties = {
        speed = 3,
      }
    },

    ["hedgehog"] = {

      animation = {
        sheet = "images/sheets/hedgehog.png",
        size  = { 84, 63 },
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      behavior = {
        eat = { "acorn" },
        jump = { "pinecone" },
        die = { "berry", "beehive"}
      },

      properties = {
        speed = 3,
      }  
    },

    ["mouse"] = {

      animation = {
        sheet = "images/sheets/mouse.png",
        size  = { 72, 54 },
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      behavior = {
        eat = { "berry" },
        jump = { "beehive" },
        die = { "acorn", "pinecone" }
      },
    
      properties = {
        speed = 2,
      }
    },

    ["rabbit"] = {

      animation = {
        sheet = "images/sheets/rabbit.png",
        size  = { 84, 63 },
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      behavior = {
        eat = { },
        jump = { "acorn", "berry", "pinecone" },
        die = { "beehive"}
      },

      properties = {
        speed = 1,
      }
    }
  },

  --
  -- weapons
  --

  weaponNames = {"acorn", "berry", "pinecone", "beehive"},

  weapons = {

    ["acorn"] = {

      animation = {
        sheet = "images/sheets/acorn.png",
        size  = { 30, 30 },
        frames = 1,
        time = 500,
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3,
        radius = 15
      },

      properties = {
        speed = 1,
        recharge = 1
      }
    },

    ["berry"] = {

      animation = {
        sheet = "images/sheets/berry.png",
        size  = { 30, 30 },
        frames = 1,
        time = 500,
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3,
        radius = 15
      },

      properties = {
        speed = 2,
        recharge = 1
      }
    },

    ["pinecone"] = {

      animation = {
        sheet = "images/sheets/pinecone.png",
        size  = { 30, 30 },
        frames = 1,
        time = 500,
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3,
        radius = 15
      },

      properties = {
        speed = 3,
        recharge = 2
      }
    },

    ["beehive"] = {

      animation = {
        sheet = "images/sheets/beehive.png",
        size  = { 30, 30 },
        frames = 1,
        time = 500,
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3,
        radius = 15
      },

      properties = {
        speed = 3,
        recharge = 3
      }
    },
  }
}
