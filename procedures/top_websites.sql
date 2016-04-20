select websites.website_address, count(visits.visit_ip) as totalHits from websites, pages, visits
  where websites.website_id = pages.website_id
    and pages.page_id = visits.page_id
    and visits.visit_timestamp > sysdate - 20
  group by websites.website_address
  order by totalHits desc;