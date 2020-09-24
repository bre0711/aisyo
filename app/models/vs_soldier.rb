class VsSoldier < ActiveHash::Base
  self.data = [
    { id: 3, name: '--' },
    { id: 2, name: '+2' },
    { id: 1, name: '+1' },
    { id: 0, name: '±0' },
    { id: -1, name: '-1' },
    { id: -2, name: '-2' }
]
end
