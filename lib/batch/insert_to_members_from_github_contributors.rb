require 'open-uri'

res = open('https://api.github.com/repos/yochiyochirb/meetups/stats/contributors')

# res.status => ["200", "OK"]
status, msg = res.status

unless status == '200'
  puts "STATUS CODE: #{status}, MESSAGE: #{msg}"
  exit
end

contributors = ActiveSupport::JSON.decode res.read
contributors.each do |contributor|
  author = contributor['author']
  next if Candidate.find_by(uid: author['id'].to_s)
  member = Candidate.create!(
    nickname: author['login'],
    uid: author['id'].to_s,
    image_url: author['avatar_url'])
end

Candidate.create(nickname: 'Yui Ogasawara', uid: '0', image_url: 'http://sample.com')
