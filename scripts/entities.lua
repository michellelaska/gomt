--
-- entity data
--

return {

  --
  -- animals
  --

  animalNames = { "mouse", "hedgehog", "squirrel", "rabbit" },

  animals = {

    ["bear"] = {

      animation = {
        sheet = "images/sheets/bear.png",
        size  = {147, 120},
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      properties = {

      }
    },

    ["mouse"] = {

      animation = {
        sheet = "images/sheets/mouse.png",
        size  = {72, 54},
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      properties = {

      }
    },

    ["hedgehog"] = {

      animation = {
        sheet = "images/sheets/hedgehog.png",
        size  = {84, 63},
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      properties = {

      }
    },

    ["squirrel"] = {

      animation = {
        sheet = "images/sheets/squirrel.png",
        size  = {84, 63},
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      properties = {

      }
    },

    ["rabbit"] = {

      animation = {
        sheet = "images/sheets/rabbit.png",
        size  = {84, 63},
        frames = 2,
        time = 500
      },

      physics = {
        density = 1.0,
        friction = 0.3,
        bounce = 0.3
      },

      properties = {

      }
    }
  },

  --
  -- weapons
  --

  weapons = {

    ["acorn"] = {

      animation = {
        sheet = "images/sheets/acorn.png",
        size  = {30, 30},
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

      }
    },

    ["berry"] = {

      animation = {
        sheet = "images/sheets/berry.png",
        size  = {30, 30},
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

      }
    },

    ["beehive"] = {

      animation = {
        sheet = "images/sheets/beehive.png",
        size  = {30, 30},
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

      }
    },

    ["pinecone"] = {

      animation = {
        sheet = "images/sheets/pinecone.png",
        size  = {30, 30},
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

      }
    }
  },

  --
  -- platforms
  -- 

  platforms = {

  }
}
