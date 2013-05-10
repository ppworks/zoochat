# coding: utf-8
Provider.find_or_create_by_name('facebook')
if Room.count == 0
  Room.create(name: 'いぬ部屋', max_count: 0)
  Room.create(name: 'ねこ部屋', max_count: 0)
  Room.create(name: 'うし部屋', max_count: 0)
  Room.create(name: 'とり部屋', max_count: 0)
end
[FortuneSlip].each do |c|
  next if c.count > 0
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  list[c.to_s.tableize.to_sym].each do |r|
    c.create! do |t|
      r.each do |i, v|
        t.send "#{i}=", v
      end
    end
  end
end
