// helper
const pipe = (...fs) => (x) => fs.reduce((y, f) => f(y), x)

// mixins
const withCapacity = (capacity = 2) => o => {
  let isFull = false;
  let availableSeats = capacity;

  return Object.assign({}, o,
    {
      getAvailableSeats: () => availableSeats,
      getCapacity: () => capacity,
      isFull: () => isFull,
      fillSeats(n) {
        if (n <= availableSeats) availableSeats -= n
        isFull = (availableSeats === 0)
        return this
      },
    }
  )
}
const withMovement = o => {
  let isMoving = false

  return Object.assign({}, o, {
    move() {
      isMoving = true
      return this
    },
    stop() {
      isMoving = false
      return this
    },
    isMoving: () => isMoving,
  })
}
const withWheels = (wheels = 4) => o => Object.assign({}, o, {
  wheels,
})


// vehicle factory
const createVehicle = ({ capacity, wheels }) => pipe(
  withWheels(wheels),
  withMovement,
  withCapacity(capacity),
)({})


// finally, a vehicle
const vehicle = createVehicle({
  capacity: 2,
  wheels: 18,
})

console.log('Capacity:', vehicle.getCapacity())
console.log('Fill all seats?', vehicle.fillSeats(vehicle.getAvailableSeats()).isFull() === true)

console.log('Wheels:', vehicle.wheels)
console.log('Can move:', vehicle.move().isMoving() === true)
console.log('Can stop:', vehicle.stop().isMoving() === false)

