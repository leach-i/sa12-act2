require 'httparty'

def get_repositories(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  return JSON.parse(response.body)
end

def find_most_starred_repository(repositories)
  most_starred_repo = nil
  max_stars = 0

  repositories.each do |repo|
    stars = repo['stargazers_count']
    if stars >= max_stars
      max_stars = stars
      most_starred_repo = repo
    end
  end
  return most_starred_repo
end

username = 'Ruleisaac946'
repositories = get_repositories(username)
most_starred_repo = find_most_starred_repository(repositories)

if most_starred_repo
  puts "Name: #{most_starred_repo['name']}"
  puts "Description: #{most_starred_repo['description']}"
  puts "Stars: #{most_starred_repo['stargazers_count']}"
  puts "URL: #{most_starred_repo['html_url']}"
else
  puts "No repositories found for the user '#{username}'."
end
