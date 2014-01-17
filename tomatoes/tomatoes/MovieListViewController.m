//
//  MovieListViewController.m
//  tomatoes
//
//  Created by Sonal Jain on 1/16/14.
//  Copyright (c) 2014 Sonal Singhal. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieCell.h"
#import "Movie.h"

@interface MovieListViewController ()

@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) NSMutableArray *movieDetails;
@end

@implementation MovieListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.movies = [NSArray array];
        self.movieDetails = [NSMutableArray array];
    }
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.movies = [object valueForKeyPath:@"movies"];
        
        for(int i = 0; i < [self.movies count]; i++){
            NSDictionary *movie = [self.movies objectAtIndex:i];
            
            Movie *m = [[Movie alloc] initWithDictionary:movie];
            [self.movieDetails addObject:m];
        }
      //  NSLog(@"%@", object);
        [self.tableView reloadData];
    }];
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                                   
                               } else{
                                   completionBlock(NO,nil);
                               }
                               
                           }];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Movie *movie = [self.movieDetails objectAtIndex:indexPath.row];
    
    cell.movieTitleLabel.text = movie.title;
    cell.movieSynopsisLabel.text = movie.synopsis;
    cell.movieCastLabel.text = movie.cast;
    
    [self downloadImageWithURL:[NSURL URLWithString:movie.imageLink] completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            
            cell.imageView.image = image;
            
            
        }
    }];
    
    return cell;
}


@end
