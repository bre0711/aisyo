class VsMonk < ActiveHash::Base
  self.data = [
    { id: 3, name: '--' },
    { id: 2, name: '+2 (有利)' },
    { id: 1, name: '+1 (微有利)' },
    { id: 0, name: '±0 (互角)' },
    { id: -1, name: '-1 (微不利)' },
    { id: -2, name: '-2 (不利)' }
]
end
